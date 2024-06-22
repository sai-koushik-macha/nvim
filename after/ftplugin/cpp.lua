local autocmd = require("macha.autocmds").autocmd
local group = require("macha.autocmds").group("CLAGFORMAT")


autocmd("BufWritePost", {
    group = group,
    pattern = "*",
    callback = function()
        vim.cmd(":silent !clang-format -i %")
        -- vim.cmd("!echo 'Hi'")
    end,
})
