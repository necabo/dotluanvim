local lspconfig_utils = require("necabo.plugins.lspconfig.utils")

local sumneko_root_path = "/usr/share/lua-language-server"
local sumneko_binary = "/usr/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = lspconfig_utils.on_attach,
  capabilities = lspconfig_utils.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
})
