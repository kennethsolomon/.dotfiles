return {
	"voldikss/vim-floaterm", -- Floaterm plugin
	config = function()
		-- Floaterm configuration
		vim.g.floaterm_width = 0.8 -- Set the width of the Floaterm window
		vim.g.floaterm_height = 0.8 -- Set the height of the Floaterm window
		vim.g.floaterm_title = "Floaterm" -- Window title
		vim.g.floaterm_border = "rounded" -- Border style, can be 'single', 'double', 'rounded', etc.

		-- Key mappings for Floaterm
		vim.keymap.set("n", "<leader>t", ":FloatermToggle scratch<CR>", { desc = "Toggle Floaterm" })
		vim.keymap.set(
			"t",
			"<leader><leader>t",
			"<C-\\><C-n>:FloatermToggle scratch<CR>",
			{ desc = "Toggle Close Floaterm" }
		)
	end,
}
