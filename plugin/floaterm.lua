local state = {
  buf = nil,
  win = nil,
}
local function ensure_term(buf)
  if vim.bo[buf].buftype ~= 'terminal' then
    vim.api.nvim_buf_call(buf, function()
      vim.fn.termopen(vim.o.shell)
    end)
    vim.bo[buf].bufhidden = 'hide'
    vim.bo[buf].swapfile = false
  end
end

local function open_float()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = vim.api.nvim_create_buf(false, true)
    ensure_term(state.buf)
  end

  state.win = vim.api.nvim_open_win(state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.cmd 'startinsert'
end

local function toggle_float()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
    state.win = nil
    return
  end

  open_float()
end

vim.keymap.set({ 'n', 't' }, '<leader>tt', toggle_float, { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })

vim.keymap.set('n', 'q', function()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
  end
end, { buffer = state.buf })
