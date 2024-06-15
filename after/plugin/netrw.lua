vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Keymap
local nmap = require("macha.remap").nmap
nmap({ "<leader>pv", ":Ex<CR>" })
