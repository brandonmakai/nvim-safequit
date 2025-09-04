local M = {}

function M.check_dirty_buffers()
  local files = vim.fn.getbufinfo({ buflisted = 1 })
  local dirty_buffers = {}
  for _, buf in ipairs(files) do
      local buftype = vim.api.nvim_get_option_value("buftype", {buf = buf.bufnr})
      if buf.changed and buftype == "" then
          table.insert(dirty_buffers, buf)
      end
  end

  if #dirty_buffers > 1 then
      local filenames = {}
      for _, buf in ipairs(dirty_buffers) do
        table.insert(filenames, buf.name)
      end
      filenames = table.concat(filenames, ", ")

      vim.notify("Dirty buffers: " .. filenames)
      vim.cmd("wqa")
  end
end

function M.setup()
  local group = vim.api.nvim_create_augroup("SafeQuit", { clear = true })
  vim.api.nvim_create_autocmd("QuitPre", {
    group = group,
    callback = M.check_dirty_buffers
  })
end

return M
