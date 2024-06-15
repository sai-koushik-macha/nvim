local diagnostic = vim.diagnostic

-- Keymaps
local nmap = require("macha.remap").nmap

nmap({ "<leader>e", diagnostic.open_float })
nmap({ "[d", diagnostic.goto_prev })
nmap({ "]d", diagnostic.goto_next })
nmap({ "<leader>q", diagnostic.setloclist })
