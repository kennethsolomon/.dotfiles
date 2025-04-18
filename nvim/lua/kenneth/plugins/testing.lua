return {
	{
		"vim-test/vim-test",
		dependencies = {
			"preservim/vimux", -- optional, for tmux integration
		},
		config = function()
			vim.g["test#php#pest#executable"] = "vendor/bin/pest"
			vim.g["test#strategy"] = "neovim" -- or "vimux" if you use tmux

			-- Keymaps for test commands
			vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" })
			vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test File" })
			vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test Suite" })
			vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test Last" })
			vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test Visit" })
		end,
	},
}
