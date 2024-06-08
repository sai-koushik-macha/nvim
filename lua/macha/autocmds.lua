local M = {}
M.autocmd = vim.api.nvim_create_autocmd

M.group = function(group_name)
    return vim.api.nvim_create_augroup(group_name, { clear = true })
end

return M
