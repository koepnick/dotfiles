-- Custom modules
local backspace = require('backspace')

-- Backspace is handled in ~/.config/nvim/lua/backspace.lua
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })


-- Only switch to buffers that aren't being displayed in a tab
vim.api.nvim_set_keymap('n', '<Up>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', ':tabprev<CR>', { noremap = true, silent = true })

-- Backspace and bb should flip between the current and more recent buffer
vim.api.nvim_set_keymap('n', '<BS>', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bb', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tt', ':t#<CR>', { noremap = true, silent = true })

-- Up and down should move visually and not line-wise
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

for i = 1, 9 do
        -- Define the mapping for the i-th tab
        vim.api.nvim_set_keymap('n', 't' .. i, ':tabnext ' .. i .. '<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'b' .. i, ':buffer ' .. i .. '<CR>', { noremap = true, silent = true })
end



-- vim.api.nvim_set_keymap('n', 'gf', '<cmd>lua require("telescope.builtin").find_files({cwd = vim.fn.expand("<cfile>:p:h")})<cr>', { noremap = true })
