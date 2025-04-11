return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{
	    "nvim-lua/plenary.nvim",
	    lazy = true,
	    event = "VeryLazy",  -- You can also use "BufRead" or "BufEnter" depending on when you need it
  	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    lazy = false,
	    config = function()
	      require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "python", "javascript" },
		highlight = { enable = true },
		indent = { enable = true },
	      })
	    end,
	},
    -- mason.nvim for managing LSP binaries
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup()
      end,
    },

    -- mason-lspconfig to bridge mason and nvim-lspconfig
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
      config = function()
        require("mason-lspconfig").setup {
          ensure_installed = {
            "pyright",
            "gopls",
            "ts_ls",
            "clangd",
          },
        }

        local lspconfig = require("lspconfig")

        -- Set up each server
        local servers = {
          pyright = {},
          gopls = {},
          tsserver = {},
          clangd = {},
        }

        for name, config in pairs(servers) do
          lspconfig[name].setup(config)
        end
      end,
    },

    -- Core LSP support
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup()

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end,   
    }

}

