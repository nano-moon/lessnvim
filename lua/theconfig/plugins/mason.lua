-- Mason 包管理器
return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
    end,
}
