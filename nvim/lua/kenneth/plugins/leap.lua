return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require("leap")
		local leap_user = require("leap.user")

		-- Highlight matches
		leap.opts.highlight_unlabeled_phase_one_targets = true

		-- Limit leap to only the current window
		leap.opts.safe_labels = {}

		-- Case sensitivity
		leap.opts.case_sensitive = false

		-- Disable default `s`, `S`, `gs` mappings
		leap.set_default_keymaps(false)

		-- Safe deletion of keymaps
		pcall(vim.keymap.del, { "n", "x", "o" }, "s")
		pcall(vim.keymap.del, { "n", "x", "o" }, "S")

		-- Set custom mappings
		vim.keymap.set({ "n", "x", "o" }, "<leader>j", "<Plug>(leap-forward)")
		vim.keymap.set({ "n", "x", "o" }, "<leader>k", "<Plug>(leap-backward)")

		-- Suggested additional tweaks
		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group:
		leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

		-- Use the traversal keys to repeat the previous motion without
		-- explicitly invoking Leap:
		leap_user.set_repeat_keys("<enter>", "<backspace>")

		-- Define a preview filter (skip the middle of alphanumeric words):
		leap.opts.preview_filter = function(ch0, ch1, ch2)
			return not (ch1:match("%s") or ch0:match("%w") and ch1:match("%w") and ch2:match("%w"))
		end

		-- Leap highlights with Dracula+ palette
		vim.api.nvim_set_hl(0, "LeapMatch", {
			fg = "#A4FFFF", -- bright.cyan for targets
			bg = "NONE",
			bold = true,
		})

		vim.api.nvim_set_hl(0, "LeapBackdrop", {
			fg = "#545454", -- bright.black (subtle)
		})

		vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
			fg = "#FF92DF", -- bright.magenta (eye-catching)
			bg = "NONE",
			bold = true,
		})

		vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
			fg = "#D6ACFF", -- bright.blue for alt targets
			bg = "NONE",
		})

		vim.api.nvim_set_hl(0, "LeapLabelSelected", {
			fg = "#50FA7B", -- green (matches selected match aesthetic)
			bg = "NONE",
			bold = true,
		})
	end,
	lazy = false,
}
