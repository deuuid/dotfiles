local function transparent(theme)
  for _, mode in pairs(theme) do
    for _, section in pairs(mode) do
      section.bg = nil
      section.gui = nil
    end
    if mode.a then
      mode.a.fg = "#ffffff"
    end
  end
  return theme
end

require("lualine").setup({
  options = {
    theme = transparent(require("lualine.themes.iceberg_dark")),
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = {},
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
