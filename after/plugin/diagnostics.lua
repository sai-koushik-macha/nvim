local diagnostic = vim.diagnostic

diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
  },
  float = {
    source = "always",  -- Or "if_many"
  },
})

local autocmd = require("macha.autocmds").autocmd
local group = require("macha.autocmds").group("VIM-DIAGNOSTIC")

autocmd("CursorHold", {
    group = group,
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})


-- Keymaps
local nmap = require("macha.remap").nmap

nmap({ "<leader>e", diagnostic.open_float })
nmap({ "[d", diagnostic.goto_prev })
nmap({ "]d", diagnostic.goto_next })
nmap({ "<leader>q", diagnostic.setloclist })
