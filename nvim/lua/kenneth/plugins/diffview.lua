return {
	"sindrets/diffview.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		-- Keymaps for Diffview
		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
		vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
		vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File History" })
		vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { desc = "Repo History" })

		-- Dracula+ themed highlights for better diff visibility
		vim.cmd([[
			highlight DiffAdd    guibg=#26332c guifg=#50FA7B
			highlight DiffChange guibg=#32302f guifg=#FFCB6B
			highlight DiffDelete guibg=#3c2c2e guifg=#FF5555
			highlight DiffText   guibg=#1b2b34 guifg=#82AAFF gui=bold

			highlight DiffviewFilePanelInsertion guifg=#69FF94 gui=bold
			highlight DiffviewFilePanelDeletion  guifg=#FF6E6E gui=bold
		]])
	end,
}
