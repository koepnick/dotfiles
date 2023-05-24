-- Not yet working
-- Define a variable to store the previously used buffer number
local previous_buffer = nil

-- Define a function to switch to the previous buffer
function switch_to_previous_buffer()
    -- If there is a previous buffer, switch to it
    if previous_buffer ~= nil then
        vim.cmd('buffer ' .. previous_buffer)
    end
end

-- Define a function to handle the backspace key
function handle_backspace()
    -- Get the current buffer number
    local current_buffer = vim.fn.bufnr('%')

    -- If the current buffer is different from the previous buffer, update the previous buffer
    if current_buffer ~= previous_buffer then
        previous_buffer = current_buffer
    end

    -- Switch to the previous buffer
    switch_to_previous_buffer()
end

-- Map the backspace key to the handle_backspace function in normal mode and in insert mode
-- vim.api.nvim_set_keymap('n', '<BS>', ':lua handle_backspace()<CR>', { noremap = true, silent = true })
