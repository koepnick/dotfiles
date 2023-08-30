vim.opt.linespace = 0
vim.g.neovide_scale_factor = 1.2
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 1.0
vim.g.transparency = 0.4
vim.g.neovide_background_color = "#4411FF" .. alpha()


vim.g.neovide_floating_blur_amount_x = 20.0
vim.g.neovide_floating_blur_amount_y = 20.0
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_animation_length = 0.10
vim.g.neovide_cursor_trail_size = 0.2
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.o.guifont = "Hack Nerd Font Mono:h16:#e-subpixelantialias:#h-full"
