local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

vim.env.DOTFILES = "~/.dotfiles"

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = { i = { ["<C-q>"] = actions.send_to_qflist } },
    },
    -- extensions = {
    --     fzy_native = {
    --         override_generic_sorter = false,
    --         override_file_sorter = true,
    --     },
    -- },
})

-- telescope.load_extension("fzy_native")

local search_dotfiles = function()
    require("telescope.builtin").git_files({
        prompt_title = "< DOTFILES >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

local grep = function()
    require("telescope.builtin").grep_string({
        search = vim.fn.input("Grep For > "),
    })
end

local nmap = require("macha.remap").nmap

local t = require("telescope.builtin")

nmap({
    "<C-p>",
    function()
        t.git_files({
            show_untracked = true,
        })
    end,
})
nmap({ "<leader>pf", t.find_files })
nmap({ "<leader>ph", t.help_tags })
nmap({ "<leader>pm", t.keymaps })
nmap({ "<leader>pb", t.git_branches })

-- Custom functions
-- nmap({ "<leader>pd", search_dotfiles })
nmap({ "<leader>ps", grep })
