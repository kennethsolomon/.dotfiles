return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- Add the current file to the Harpoon list
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file to list" })

		-- Toggle Harpoon quick menu
		vim.keymap.set("n", "<leader><leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle quick menu" })

		-- Jump to the first Harpoon mark
		vim.keymap.set("n", "<leader><leader>j", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Go to mark 1" })

		-- Jump to the second Harpoon mark
		vim.keymap.set("n", "<leader><leader>k", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Go to mark 2" })

		-- Jump to the third Harpoon mark
		vim.keymap.set("n", "<leader><leader>l", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Go to mark 3" })

		-- Jump to the fourth Harpoon mark
		vim.keymap.set("n", "<leader><leader>;", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Go to mark 4" })
		-- vim.keymap.set("n", "<C-;>", function()
		-- 	harpoon:list():select(4)
		-- end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		-- Toggle telescope for Harpoon list
		vim.keymap.set("n", "<leader><leader>y", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
