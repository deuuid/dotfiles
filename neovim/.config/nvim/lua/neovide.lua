if vim.g.neovide then
    vim.cmd.colorscheme("quiet")
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
    vim.o.guifont = "JetBrains Mono,Symbols Nerd Font Mono:h14"
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_window_blurred = true
    vim.g.neovide_padding_top = 8
    vim.g.neovide_padding_bottom = 8
    vim.g.neovide_padding_left = 8
    vim.g.neovide_padding_right = 8
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_short_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_scroll_animation_length = 0

    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"

    vim.keymap.set("n", "<D-s>", "<cmd>w<CR>")
    vim.keymap.set("v", "<D-c>", '"+y')
    vim.keymap.set({ "n", "v" }, "<D-v>", '"+P')
    vim.keymap.set({ "i", "c" }, "<D-v>", "<C-R>+")

    vim.g.neovide_scale_factor = 1.0
    local function scale(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<D-=>", function() scale(1.1) end)
    vim.keymap.set("n", "<D-->", function() scale(1 / 1.1) end)
    vim.keymap.set("n", "<D-0>", function() vim.g.neovide_scale_factor = 1.0 end)
end
