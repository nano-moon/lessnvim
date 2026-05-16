-- autocmd.lua
-- 自动命令配置

-- 创建自动命令组
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 高亮当前行
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- 文件类型检测时启用缩进
autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- 打开文件时跳转到上次编辑位置
autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
