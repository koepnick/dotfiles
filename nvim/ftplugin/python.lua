vim.cmd.colorscheme "catppuccin-frappe"

local function get_next_line()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local next_line = vim.api.nvim_buf_get_lines(0, current_line, current_line + 1, false)[1] or ""
  return current_line, next_line
end

function TogglePythonBreakpoint()
  local current_line, next_line = get_next_line()

  local breakpoint_str = "breakpoint()"

  local indent = next_line:match("^(%s*)")
  local breakpoint_with_indent = indent .. breakpoint_str

  if next_line:find(breakpoint_str) then
    vim.api.nvim_buf_set_lines(0, current_line, current_line + 1, false, {})
  else
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {breakpoint_with_indent})
  end
end

-- return {
--   toggle_breakpoint = toggle_breakpoint
-- }

vim.api.nvim_set_keymap('n', '\\b', ':lua TogglePythonBreakpoint()<CR>', { noremap = true })
