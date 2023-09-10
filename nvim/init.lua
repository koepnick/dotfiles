require('plugins')
require('settings')
require('keybindings')
require('lsp')
require('telescope_')

require('commentary')
require('treesitter')
require('functions')
require('project')
require('surround')
require('cmp_')
require('_sandbox')

if vim.g.neovide then
    require('neovide')
end
-- require('buffers') -- Work in progress

