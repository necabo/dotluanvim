local utils = {}

local global = {}

function global.is_git_repo()
    local execute = vim.api.nvim_command
    execute("silent! !git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
end

_G["necabo"] = global

utils.map = function(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

utils.create_augroup = function(autocmds, name)
    vim.cmd("augroup " .. name)
    vim.cmd("autocmd!")
    for _, autocmd in ipairs(autocmds) do
        vim.cmd("autocmd " .. table.concat(autocmd, " "))
    end
    vim.cmd("augroup END")
end

return utils
