return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {

			[[          ▀████▀▄▄              ▄█ ]],
			[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
			[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
			[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
			[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
			[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
			[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
			[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
			[[   █   █  █      ▄▄           ▄▀   ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "📄  New File", "<cmd>ene<CR>"),
			dashboard.button("e", "📁  Toggle file explorer", "<cmd>Yazi cwd<cr>"),
			dashboard.button("f", "🔍  Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("t", "🔎  Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("r", "🔄  Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("c", "  Configuration", ":e ~/.config/nvim<CR>"),
			dashboard.button("q", "👋  Quit NVIM", "<cmd>qa<CR>"),
		}

		local function footer()
			return "Don't Stop Until You are Proud..."
		end

		dashboard.section.footer.val = footer()

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
