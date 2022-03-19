-- Setting space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap=true, silent=true})
vim.g.mapleader = ' '

-- Open and edit init.lua
vim.api.nvim_set_keymap('n', '<Leader>ve', ':edit ~/.config/nvim/init.lua<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>vr', ':source ~/.config/nvim/init.lua<CR> :echo "sourced init.lua" <CR>', {noremap=true, silent=true})

-- Closes all open buffers
vim.api.nvim_set_keymap('n', '<Leader>Q', ':bufdo bdelete<CR>', {noremap=true, silent=true}) -- 

-- Quick switch and delete buffers
vim.api.nvim_set_keymap('n', '<Leader>gn', ':bn<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>gp', ':bp<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>c', ':bd<CR>', {noremap=true, silent=true})

-- Open file under cursor

-- Clears higlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap=true, silent=true})  

-------------------
-- Plugin specific
-------------------

-- Chad tree
vim.api.nvim_set_keymap('n', '<Leader>n', ':CHADopen<CR>', {noremap=true, silent=true})

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<cr><CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<cr><CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<cr><CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<cr><CR>', {noremap=true, silent=true})

-- Dashboard
-- nmap <Leader>ss :<C-u>SessionSave<CR>
-- nmap <Leader>sl :<C-u>SessionLoad<CR>
-- nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
-- nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
-- nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
-- nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
-- nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
-- nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
