return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/nvim-cmp" },
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({})
            end,
            ["vtsls"] = function()
                lspconfig["vtsls"].setup({})
            end,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(_)
                vim.keymap.set('n', 'lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
                vim.keymap.set('n', 'lf', '<cmd>lua vim.lsp.buf.format()<CR>')
                vim.keymap.set('n', 'lr', '<cmd>lua vim.lsp.buf.references()<CR>')
                vim.keymap.set('n', 'ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
                vim.keymap.set('n', 'lD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                vim.keymap.set('n', 'li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                vim.keymap.set('n', 'lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                vim.keymap.set('n', 'lc', '<cmd>lua vim.lsp.buf.rename()<CR>')
                vim.keymap.set('n', 'la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                vim.keymap.set('n', 'lo', '<cmd>lua vim.diagnostic.open_float()<CR>')
                vim.keymap.set('n', 'ln', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                vim.keymap.set('n', 'lN', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
            end
        })

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
        )
    end
}
