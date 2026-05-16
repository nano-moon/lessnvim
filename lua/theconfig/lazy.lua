-- lazy.lua
-- lazy.nvim 插件管理器配置

-- 检测 lazy.nvim 是否已安装
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 自动扫描 plugins 目录下的所有配置文件
local plugins_dir = vim.fn.stdpath('config') .. '/lua/theconfig/plugins'
local plugins = {}

local handle = vim.loop.fs_scandir(plugins_dir)
if handle then
    while true do
        local name, type = vim.loop.fs_scandir_next(handle)
        if not name then break end
        if type == 'file' and name:match('%.lua$') then
            local module_name = 'theconfig.plugins.' .. name:gsub('%.lua$', '')
            local ok, plugin_config = pcall(require, module_name)
            if ok and plugin_config then
                table.insert(plugins, plugin_config)
            end
        end
    end
end

-- 加载插件
require('lazy').setup(plugins, {
    ui = {
        border = 'rounded',
    },
})

-- 插件加载完成后设置主题
vim.cmd[[colorscheme tokyonight]]
