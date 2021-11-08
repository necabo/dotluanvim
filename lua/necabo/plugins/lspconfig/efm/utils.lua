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

M.resolve_enabled_tools = function(tools)
  local custom_config = read_custom_config_json()
  if custom_config == nil then
    return {}
  end

  local resolved_tools = {}
  for _, tool in ipairs(tools) do
    if custom_config[tool .. "_enabled"] then
      table.insert(resolved_tools, require("necabo.plugins.lspconfig.efm." .. tool))
    end
  end
  return resolved_tools
end

return M
