require("nvim-treesitter").install({
  "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
  "bash", "json", "yaml", "toml", "xml", "html", "css",
  "javascript", "typescript", "dart", "gitcommit", "diff",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf, lang)
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
