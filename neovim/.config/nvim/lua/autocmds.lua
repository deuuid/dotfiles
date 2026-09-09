local grp = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

local transparent_groups = {
  "Normal", "NormalFloat", "NormalNC", "EndOfBuffer", "StatusLine", "StatusLineNC",
}
local function make_transparent()
  for _, g in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, g, { bg = "NONE", ctermbg = "NONE" })
  end
end
vim.api.nvim_create_autocmd("ColorScheme", { group = grp, callback = make_transparent })
make_transparent()

vim.api.nvim_create_autocmd("TextYankPost", {
  group = grp,
  callback = function() vim.hl.on_yank() end,
})
