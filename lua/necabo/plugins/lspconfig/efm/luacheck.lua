return {
  lintCommand = "luacheck --formatter plain -",
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintSource = "luacheck",
}
