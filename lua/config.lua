local modules = {
    'theconfig.lazy', -- lazy.nvim 插件管理器（必须最先加载）
    'theconfig.option',      -- 基础选项
    'theconfig.keymap',     -- 键位映射
    'theconfig.autocmd',     -- 自动命令
}

-- 遍历加载所有模块
for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
        vim.notify('Failed to load ' .. module .. ': ' .. err, vim.log.levels.ERROR)
    end
end