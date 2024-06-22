local status_ok = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

require("nvim-treesitter.configs").setup({
    ensure_installed = {"bash", "c", "cmake", "cpp", "lua", "make", "python"},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true, disable = { "yaml" } },
})
