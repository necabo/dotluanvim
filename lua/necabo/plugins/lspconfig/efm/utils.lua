-- read in custom config from .wsconfig/custom.json
local M = {}

local function read_custom_config_json()
  -- TODO: use root_patterns from lspconfig to find project root

  local local_ls_config_path = ".wsconfig/custom.json"

  if vim.fn.filereadable(local_ls_config_path) == 0 then
    return nil
  end

  local local_json_config = vim.fn.readfile(local_ls_config_path)
  local local_config_table = vim.fn.json_decode(local_json_config)
  return local_config_table
end

M.if_enabled = function(tool_name)
  local custom_config = read_custom_config_json()
  if custom_config == nil then
    return {}
  end

  if custom_config[tool_name .. "_enabled"] then
    return require("necabo.plugins.lspconfig.efm." .. tool_name)
  end
  return {}
end

return M
