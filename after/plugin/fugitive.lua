local nmap = require("macha.remap").nmap

local autocmd = require("macha.autocmds").autocmd
local group = require("macha.autocmds").group("FUGITIVE")

nmap({ "<leader>gs", vim.cmd.Git })

autocmd("BufWinEnter", {
    group = group,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        nmap({
            "<leader>p",
            function()
                vim.cmd.Git("push")
            end,
            opts,
        })

        -- rebase always
        nmap({
            "<leader>P",
            function()
                vim.cmd.Git({ "pull --rebase" })
            end,
            opts,
        })

        nmap({
            "<leader>t",
            function()
                vim.cmd.Git({ "push -u origin" })
            end,
            opts,
        })
    end,
})
