 vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth' ,
	--{
		-- Theme inspired by Atom
	--	'navarasu/onedark.nvim',
	--	priority = 1000,
	--	config = function()
	--		vim.cmd.colorscheme 'onedark'
	--	end,
	--},
	{ "catppuccin/nvim", name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'catppuccin'
		end
},
	{import ="plugin"},

	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
		},
	},
	{
		'ThePrimeagen/vim-be-good'
	},
})
require("config")
