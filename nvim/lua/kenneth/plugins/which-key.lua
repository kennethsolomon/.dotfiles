return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},

	config = function()
		vim.keymap.set({ "n" }, "<leader><leader>a", ":Alpha<CR>", { desc = "Alpha" })
	end,
}
