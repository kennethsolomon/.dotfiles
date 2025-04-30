return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			mode = "topline",
			line_numbers = true,
			max_lines = 1,
			multiwindow = true,
		})
	end,
}
