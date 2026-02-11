local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "stevearc/oil.nvim"
  use 'm4xshen/autoclose.nvim'
  use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            delay = 500,
            plugins = {
                presets = {
                    motions = true,
                },
            },
        }
    end,    
  }
  use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "doom",
      config = {
        header = {
          [[                ..::---==----::..                 ]],
          [[            .:-========------------..             ]],
          [[         .:-=========------------::::::.          ]],
          [[       .-==========------------::::::::::.        ]],
          [[     .-===+++====------------:::-+*#*:::::::      ]],
          [[    :====+%%%%%#+------===-:::=#%%%%%*:::::::.    ]],
          [[   -=====*%%%%%%%%*##%%%%%%%%#%%%%%%%%::::::::.   ]],
          [[  -======+%%%%%%%%%%%%%%%%%%%%%%%%%%%#:::::::::.  ]],
          [[ :=======-#%%%%%%%%%%%%%%%%%%%%%%%%%%#-:::::::::. ]],
          [[.======---#%%%%%%%%%#*+*#%%%%%%*+=+#%%%*::::::::: ]],
          [[:====----#%%%%%%%%%-.:--.-%%%%=-+++-=%%%#::::::::.]],
          [[-==-----*%%%%%%%%%#+%%%%%*#%%%#%%%%%%%%%%+:::::::.]],
          [[=-------%%%%%%%%%%%%%%%%%%%*+==*%%%%%%%%%%::::::::]],
          [[-------=%%%%%%%%%%%%%%%%%%%#+-+%%%%%%%%%%%-::::::.]],
          [[:------=%%%%%%%%%%%%%%%%%%+**=-==#%%%%%%%#:::::::.]],
          [[ ------:#%%%%%%%%%%%%%%%%%%**#%%%%%%%%%%%=::::::: ]],
          [[ :---:::=%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%+:::::::. ]],
          [[  :::::::=%%%%%%%%%%%%%%%%%%%%%%%%%%%%#=:::::::.  ]],
          [[   .::::::-*%%%%%%%%%%%%%%%%%%%%%%%%*=::::::::.   ]],
          [[    .::::::::=#%%%%%%%%%%#*#%%##%%%=:::::::::.    ]],
          [[      .:::::::#%%%%%%%%%%*---=--#%%+::::::::      ]],
          [[       .:::::=%%%%%%%%%%%%==+#**%%%*::::::        ]],
          [[          .::#%%%%%%%%%%%%%%%%%%%%%#:::.          ]],
          [[             +#%%%%%%%%%%%%%%%%%%%%*.             ]],
          [[                :-=+*##%%%%##*+=-.                ]],
        },
        center = {
          {
            icon = '󰈞 ',
            icon_hl = 'Title',
            desc = 'Find Current Files           ',
            desc_hl = 'String',
            key = 'b',
            keymap = 'SPC f f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(1)'
          },
          {
            icon = '󰈞 ',
            desc = 'Find Other files         ',
            key = 'o',
            keymap = 'SPC spc',
            key_format = ' %s', -- remove default surrounding '[]'
            action = 'lua print(2)'
          },
          {
            icon = ' ',
            desc = 'Keymaps              ',
            key = 'f',
            keymap = 'SPC d',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(3)'
          },
        },
      },
      footer = {}
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}



  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
