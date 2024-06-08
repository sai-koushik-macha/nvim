local nmap = require("macha.remap").nmap

local opts = { noremap = true, silent = true }

nmap({ "<leader>sop", ":luafile %<CR>", opts })
nmap({ "<leader>x", ":!chmod +x %<CR>", opts })
