for _, group in ipairs(vim.fn.getcompletion('js', 'highlight')) do
  if group:sub(1, 4) ~= 'json' then
    vim.api.nvim_set_hl(0, group, {})
  end
end
