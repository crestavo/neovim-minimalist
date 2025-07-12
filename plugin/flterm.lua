-- Remap leaving 'terminal mode' to double tap esc
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

vim.keymap.set("t", "<esc>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', false)
  -- Close floating window if valid
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
  end
end, { noremap = true, silent = true })

local function open_floating_terminal(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  if not buf then
    error("Failed to create buffer")
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_terminal({ buf = state.floating.buf });
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd("terminal powershell")
    end
    vim.cmd("startinsert!")
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Flterm", toggle_terminal, {})
vim.api.nvim_set_keymap('n', '<leader>ft', [[:Flterm<CR>]], { noremap = true, silent = true })
