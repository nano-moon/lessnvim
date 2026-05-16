-- Mason 与 LSPConfig 桥接
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup()

        -- 自动配置已安装的 LSP
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        })
    end,
}
