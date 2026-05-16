-- 设置 leader 键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 基本键位映射
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 保存文件
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>e', ':Neotree<CR>', opts)
map('n', '<leader>mm', ':Mason<CR>', opts)


--Telescope快捷键（延迟加载，确保插件已安装）
vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyDone',
    callback = function()
        local builtin = require('telescope.builtin')
        map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
})