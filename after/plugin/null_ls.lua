local status_ok_null_ls, null_ls = pcall(require, "null-ls")
if not status_ok_null_ls then
    return
end

local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        -- completion
        completion.spell.with({ filetypes = { "markdown", "text" } }),

        -- diagnostics
        diagnostics.shellcheck,
        diagnostics.clang_tidy,

        formatting.clang_format,
        formatting.trim_newlines,
        formatting.trim_whitespace,
    },
    diagnostics_format = "[#{c}] #{m}",
})

local autocmd = require("macha.autocmds").autocmd
local group = require("macha.autocmds").group("LSP")

autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format()
    end,
    group = group,
})
