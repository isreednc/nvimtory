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

}
