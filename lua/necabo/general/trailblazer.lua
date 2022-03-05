local P = {}
local M = {}

local utils = require("necabo.utils")

P.window_matches = {}

M.setup = function()
  utils.create_augroup({
    { [[WinEnter,BufEnter,InsertLeave * lua require('necabo.general.trailblazer').show()]] },
    { [[WinLeave,BufLeave,InsertEnter * lua require('necabo.general.trailblazer').hide()]] },

    { [[OptionSet buftype lua require('necabo.general.trailblazer').track_buftype()]] },
  }, "necabo_trailblazer")

  vim.api.nvim_exec([[highlight default link Trailblazer Error]], false)
end

M.show = function()
  if vim.fn.mode() ~= "n" then
    M.hide()
    return
  end

  if not M.is_buffer_normal() then
    return
  end

  local win_id = vim.api.nvim_get_current_win()
  if not vim.api.nvim_win_is_valid(win_id) then
    return
  end

  if P.window_matches[win_id] ~= nil then
    return
  end

  local match_id = vim.fn.matchadd("Trailblazer", [[\s\+$]])
  P.window_matches[win_id] = { id = match_id }
end

M.hide = function()
  local win_id = vim.api.nvim_get_current_win()
  local win_match = P.window_matches[win_id]
  if not vim.api.nvim_win_is_valid(win_id) or win_match == nil then
    return
  end

  pcall(vim.fn.matchdelete, win_match.id)
  P.window_matches[win_id] = nil
end

M.track_buftype = function()
  if vim.v.option_new == "" then
    M.show()
  else
    M.hide()
  end
end

M.is_buffer_normal = function(buf_id)
  return vim.api.nvim_buf_get_option(buf_id or 0, "buftype") == ""
end

return M
