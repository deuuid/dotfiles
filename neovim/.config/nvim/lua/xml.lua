vim.env.XMLLINT_INDENT = "\t"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "xml", "xsd", "xslt", "svg", "plist", "pom" },
  callback = function()
    vim.bo.equalprg = "xmllint --format --noblanks --nowarning --noenc --encode UTF-8 -"
    vim.bo.formatprg = "xmllint --format --noblanks --nowarning --noenc --encode UTF-8 -"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

local function xml_charset(enc)
  enc = (enc or ""):lower()
  local map = {
    ["utf-8"] = "UTF-8", ["utf8"] = "UTF-8",
    ["utf-16"] = "UTF-16", ["utf-16le"] = "UTF-16", ["utf-16be"] = "UTF-16",
    ["ucs-2"] = "UTF-16", ["ucs-2le"] = "UTF-16",
    ["latin1"] = "ISO-8859-1", ["iso-8859-15"] = "ISO-8859-15",
    ["cp866"] = "IBM866", ["koi8-r"] = "KOI8-R", ["koi8-u"] = "KOI8-U",
  }
  if map[enc] then return map[enc] end
  local n = enc:match("^cp(%d+)$")
  if n then return "windows-" .. n end
  return enc ~= "" and enc:upper() or nil
end

local function buffer_charset()
  local fenc = vim.bo.fileencoding
  return xml_charset(fenc ~= "" and fenc or vim.o.encoding)
end

local function set_prolog_encoding(out, charset)
  if not charset then return out end
  local first = out[1] or ""
  if first:match("^%s*<%?xml.-%?>") then
    if first:match('encoding%s*=%s*["\']') then
      out[1] = first:gsub('encoding%s*=%s*(["\'])[^"\']*%1', 'encoding="' .. charset .. '"', 1)
    else
      out[1] = first:gsub('(<%?xml.-)%s*%?>', '%1 encoding="' .. charset .. '"?>', 1)
    end
  else
    table.insert(out, 1, '<?xml version="1.0" encoding="' .. charset .. '"?>')
  end
  return out
end

local function run_xmllint(extra_args)
  local args = { "xmllint", "--noblanks", "--nowarning", "--noenc", "--encode", "UTF-8" }
  vim.list_extend(args, extra_args or {})
  table.insert(args, "-")
  local src = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local out = vim.fn.systemlist(args, src)
  if vim.v.shell_error ~= 0 then
    vim.notify("xmllint: " .. table.concat(out, "\n"), vim.log.levels.ERROR)
    return nil
  end
  return out
end

vim.api.nvim_create_user_command("XmlFormat", function()
  local out = run_xmllint({ "--format" })
  if not out then return end
  set_prolog_encoding(out, buffer_charset())
  local view = vim.fn.winsaveview()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, out)
  vim.fn.winrestview(view)
end, { desc = "Pretty-print XML buffer" })

vim.api.nvim_create_user_command("XmlMinify", function()
  local out = run_xmllint()
  if not out then return end
  if out[1] and out[1]:match("^%s*<%?xml") then
    local decl = { out[1] }
    set_prolog_encoding(decl, buffer_charset())
    out[1] = decl[1]
  end
  local view = vim.fn.winsaveview()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, { table.concat(out, "") })
  vim.fn.winrestview(view)
end, { desc = "Minify XML buffer to one line" })
