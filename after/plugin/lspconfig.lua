local status_ok_lsp = pcall(require, "lspconfig")
if not status_ok_lsp then
    return
end



local servers = {
    "clangd",
}

local buf = vim.lsp.buf

local on_attach = function()
    -- Mappings.
    local nmap = require("macha.remap").nmap
    local bufopts = { noremap = true, silent = true }
    nmap({ "<leader>vD", buf.declaration, bufopts })
    nmap({ "<leader>vd", buf.definition, bufopts })
    nmap({ "<leader>vi", buf.implementation, bufopts })
    nmap({ "<leader>vrr", buf.references, bufopts })
    nmap({ "<leader>vt", buf.type_definition, bufopts })

    nmap({ "<leader>vwa", buf.add_workspace_folder, bufopts })
    nmap({ "<leader>vwr", buf.remove_workspace_folder, bufopts })
    nmap({
        "<leader>vwl",
        function()
            print(vim.inspect(buf.list_workspace_folders()))
        end,
        bufopts,
    })

    nmap({ "<leader>vh", buf.hover, bufopts })
    nmap({ "<leader>vs", buf.signature_help, bufopts })

    nmap({ "<leader>vrn", buf.rename, bufopts })
    nmap({ "<leader>vca", buf.code_action, bufopts })
    nmap({
        "<leader>vf",
        function()
            buf.format({ async = true })
        end,
        bufopts,
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- 
-- require("lspconfig").lua_ls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             runtime = {
--                 version = "LuaJIT",
--             },
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- })
