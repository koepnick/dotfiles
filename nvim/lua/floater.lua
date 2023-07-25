local api = vim.api

local function OpenInFloatingWindow()
    local bufnr = api.nvim_create_buf(false, true)

    local visual_selection = function()
        local _, csrow, cscol, _ = unpack(api.nvim_buf_get_mark(0, '<'))
        local _, cerow, cecol, _ = unpack(api.nvim_buf_get_mark(0, '>'))
        local lines = api.nvim_buf_get_lines(0, csrow-1, cerow, false)
        for i, v in ipairs(lines) do
            print(i, v)
        end
        print(lines)
        lines[1] = lines[1]:sub(cscol+1)
        lines[#lines] = lines[#lines]:sub(1, cecol)
        return lines
    end
    local lines = visual_selection()

    api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
    local width = vim.api.nvim_get_options("columns")
    local height = vim.api.nvim_get_options("lines")
    local win_id = api.nvim_open_win(bufnr, true, {
        relative='editor',
        width=width - 4,
        height=height - 4,
        col=2,
        row=2,
        style='minimal',
        border='rounded'
    })
end

return {
    OpenInFloatingWindow = OpenInFloatingWindow,
}

