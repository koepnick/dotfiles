function EditFiletype()
    local ft = vim.bo.filetype
    local config_dir = "~/.config/nvim/ftplugin/"
    local config_file = config_dir .. ft .. ".vim"
    vim.cmd("edit " .. config_file)
end

vim.cmd("command! EditFiletype :lua EditFiletype()")
