vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function ()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ 'UIEnter', 'VimResume', 'FocusGained' }, {
  callback = function ()
    vim.cmd.checktime()
  end,
})

local buf_winview_map = {}

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '*',
  callback = function ()
    local bufnr = vim.api.nvim_get_current_buf()
    buf_winview_map[bufnr] = vim.fn.winsaveview()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function ()
    local bufnr = vim.api.nvim_get_current_buf()
    if buf_winview_map[bufnr] ~= nil then
      local v = vim.fn.winsaveview()
      if v.lnum == 1 and v.col == 0 and not vim.o.diff then
        vim.fn.winrestview(buf_winview_map[bufnr])
      end
      buf_winview_map[bufnr] = nil
    end
  end,
})
