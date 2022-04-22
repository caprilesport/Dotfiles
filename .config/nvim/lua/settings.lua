----------------------------------------------------------------
-- This file holds all the general configurations
----------------------------------------------------------------

-- Shortcuts 
local cmd = vim.cmd     		-- Execute Vim commands
local exec = vim.api.nvim_exec 	-- Execute Vimscript
local g = vim.g       			-- Global variables
local opt = vim.opt      		-- Set options (global/buffer/windows-scoped)


-- General
g.mapleader = ' '               -- Change leader to a comma
opt.mouse = 'a'                 -- Enable mouse support
opt.clipboard = 'unnamedplus'   -- Copy/paste to system clipboard
opt.swapfile = false            -- Don't use swapfile
opt.syntax = 'on'               -- vimwiki requires this  

-- UI
opt.number = true               -- Show line number
opt.relativenumber=true         -- Show relative number of lines
opt.showmatch = true            -- Highlight matching parenthesis
opt.foldmethod = 'marker'       -- Enable folding (default 'foldmarker')
opt.splitright = true           -- Vertical split to the right
opt.splitbelow = true           -- Orizontal split to the bottom
opt.ignorecase = true           -- Ignore case letters when search
opt.smartcase = true            -- Ignore lowercase for the whole pattern
opt.linebreak = true            -- Wrap on word boundary
opt.termguicolors=true          -- Match the terminal colors
opt.confirm=true                -- If quitting without saving ask for save
opt.scrolloff=8                 -- Never reach end of screen while scrolling
opt.sidescrolloff=8             -- Same as above but sideways

-- CPU/Memory
opt.hidden = true               -- Enable background buffers
opt.history = 100               -- Remember N lines in history
opt.lazyredraw = true           -- Faster scrolling
opt.synmaxcol = 240             -- Max column for syntax highlight

-- Tabs/indent
opt.expandtab = true            -- Use spaces instead of tabs
opt.shiftwidth = 4              -- Shift 4 spaces when tab
opt.tabstop = 4                 -- 1 tab == 4 spaces
opt.smartindent = true          -- Autoindent new lines


-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)

-- Don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-------------------
-- Plugin specific
-------------------

-- vimwiki

cmd([[ let wiki_0 = {} ]])
cmd([[ let wiki_0.path = '~/vimwiki' ]])
cmd([[ let wiki_0.syntax = 'markdown' ]])
cmd([[ let wiki_0.ext = '.md' ]])

cmd([[ let wiki_1 = {} ]])
cmd([[ let wiki_1.path = '~/vimwiki/work' ]])
cmd([[ let wiki_1.syntax = 'markdown' ]])
cmd([[ let wiki_1.ext = '.md' ]])

cmd([[ let wiki_2 = {} ]])
cmd([[ let wiki_2.path = '~/vimwiki/personal' ]])
cmd([[ let wiki_2.syntax = 'markdown' ]])
cmd([[ let wiki_2.ext = '.md' ]])


cmd([[ let g:vimwiki_list = [wiki_0, wiki_1, wiki_2] ]])
cmd([[ let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'} ]])

-- cmd([[ let wiki_3 = {} ]])
-- cmd([[ let wiki_3.path = ~/vimwiki/.md ]])
-- cmd([[ let wiki_3.syntax = 'markdown' ]])
-- cmd([[ let wiki_3.ext = '.md' ]])

-- -- Dashboard
-- g.dashboard_custom_shortcut_icon['last_session'] = ' '
-- g.dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- g.dashboard_custom_shortcut_icon['find_file'] = ' '
-- g.dashboard_custom_shortcut_icon['new_file'] = ' '
-- g.dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- g.dashboard_custom_shortcut_icon['find_word'] = ' '
-- g.dashboard_custom_shortcut_icon['book_marks'] = ' '

-- g.dashboard_custom_shortcut={
-- 'last_session'       : 'SPC s l',
-- 'find_history'       : 'SPC f h',
-- 'find_file'          : 'SPC f f',
-- 'new_file'           : 'SPC c n',
-- 'change_colorscheme' : 'SPC t c',
-- 'find_word'          : 'SPC f a',
-- 'book_marks'         : 'SPC f b',
-- }

-- go 

require('go').setup()


