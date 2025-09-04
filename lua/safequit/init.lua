local fn = vim.fn

vim.cmd([[
  augroup SafeQuit
    autocmd!
    autocmd QuitPre * lua require("safequit").check_dirty_buffers()
  augroup END
]])

local M = {}
function M.check_dirty_buffers()
  local files = fn.getbufinfo({buflisted=1})
  local filenames = {}
  for _, buf in ipairs(files) do
    table.insert(filenames, buf.name)
  end

  -- CLI call
  local cli = "nvim-safequit"
  local json = fn.system(cli .. " --files" .. table.concat(filenames, " ") .. "--json")
  local result = fn.json_decode(json)
  if #result.dirty > 1 then
    -- run wqa automatically
    vim.cmd("wqa")
  end
end
