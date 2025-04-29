return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_auto_start = 1
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
	end,
}
