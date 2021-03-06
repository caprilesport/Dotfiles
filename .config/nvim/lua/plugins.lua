----------------------------------------------------------------
-- This file holds the plugins and all of its configurations 
--------------------------------------------------------------
-- Bootstraping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Colorscheme
  -- use 'Mofiqul/dracula.nvim'
  -- use 'marko-cerovac/material.nvim' 
  -- vim.g.material_style = "deep ocean"
  
  use 'folke/tokyonight.nvim'
  vim.g.tokyonight_style = "night"

  -- Simple stuff
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sensible'
  use 'itchyny/calendar.vim'
  use 'grimme-lab/orca.vim'



  -- use 'tpope/vim-fugitive'
  use 'ledger/vim-ledger'
  use 'sheerun/vim-polyglot'
  use 'christoomey/vim-tmux-navigator'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'farmergreg/vim-lastplace'
  use 'iamcco/markdown-preview.nvim'

  -- use 'govim/govim'
  use 'ray-x/go.nvim'
  require('go').setup()
  vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

  --CHADTree 
  use {'ms-jpq/chadtree', branch='chad', run='python3 -m chadtree deps'}
  -- local chadtree_settings = 'chadtree_settings.view.width = {20}'
  -- vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

  -- vimwiki
  use 'vimwiki/vimwiki'
  use 'michal-h21/vimwiki-sync'
  use 'preservim/tagbar'

  -- Minimap 
  -- use 'wfxr/minimap.vim' 
  -- vim.g.minimap_width = '10'
  -- vim.g.minimap_auto_start = '1'
  -- vim.g.minimap_auto_start_win_enter = '1'

  -- Julia
  use 'JuliaEditorSupport/julia-vim'
  vim.g.latex_to_unicode_auto = '1'
  vim.g.latex_to_unicode_tab = '0'
  
  -- Rust
  use 'simrat39/rust-tools.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-lua/plenary.nvim'

  -- Latex 
  use 'lervag/vimtex' 
  vim.g.tex_flavor='latex' 
  vim.g.vimtex_view_method='zathura'
  vim.g.vimtex_quickfix_mode=0
  vim.g.tex_conceal='abdmg'

  --Snippets for latex
  use 'SirVer/ultisnips'
  vim.g.UltiSnipsExpandTrigger="<c-b>"
  vim.g.UltiSnipsJumpForwardTrigger="<c-b>"
  vim.g.UltiSnipsJumpBackwardTrigger="<c-z>"
  -- :UltiSnipsEdit splits your window.
  vim.g.UltiSnipsEditSplit="vertical"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')

  -- Lualine configs 
  use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = { left = '???', right = '???'},
      section_separators = { left = '???', right = '???'},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
    extensions = {}
  }

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  local lspconfig = require('lspconfig')

  require'lspconfig'.pylsp.setup{}
  require'lspconfig'.clangd.setup{}
  require('rust-tools').setup({})
  require'lspconfig'.julials.setup{}
  require'lspconfig'.bashls.setup{}
  require'lspconfig'.gopls.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.jsonls.setup{}


  -- TreeSitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
  }

  require'nvim-treesitter.configs'.setup {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }

  -- COQ
  use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq.thirdparty'

  -- Automatically start coq
  vim.g.coq_settings = { auto_start = 'shut-up' }

  -- Enable some language servers with the additional completion capabilities offered by coq_nvim
  local servers = { 'clangd', 'rust_analyzer', 'pylsp', 'tsserver','gopls' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
      on_attach = my_custom_on_attach,
    }))
  end
  


end)


