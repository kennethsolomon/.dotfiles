return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		-- intelephense
		local on_attach = function()
			vim.diagnostic.config({
				virtual_text = true,
			})
		end

		local get_intelephense_license = function()
			local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
			local content = f:read("*a")
			f:close()
			return string.gsub(content, "%s+", "")
		end
		-- end intelephense

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", function()
					require("telescope.builtin").lsp_references({ include_declaration = false })
				end, opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show signature help"
				keymap.set("n", "<leader>sg", vim.lsp.buf.signature_help, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "List diagnostics (Telescope)"
				keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>", opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["phpactor"] = function()
				lspconfig["phpactor"].setup({
					capabilities = capabilities,
					init_options = {
						["language_server_phpstan.enabled"] = false,
						["language_server_psalm.enabled"] = false,
						["language_server.diagnostic_outsource"] = false,
						diagnostic = {
							enable = false, -- disables Phpactor diagnostics (let Intelephense handle it)
						},
					},
					handlers = {
						["textDocument/completion"] = function() end,
						["textDocument/hover"] = function() end,
						["textDocument/definition"] = function() end,
						["textDocument/references"] = function() end,
						["textDocument/documentSymbol"] = function() end,
						["workspace/symbol"] = function() end,
						["textDocument/publishDiagnostics"] = function() end, -- ✨ disables all diagnostics
					},
				})
			end,
			["intelephense"] = function()
				lspconfig["intelephense"].setup({
					on_attach = on_attach,
					init_options = {
						licenceKey = get_intelephense_license(),
					},
					capabilities = capabilities,
					settings = {
						intelephense = {
							files = {
								maxSize = 5000000, -- Increase file size limit if needed for large Laravel projects
							},
							environment = {
								includePaths = {
									"vendor/php-stubs/laravel",
									"vendor/beyondcode/laravel-websockets/src",
									"vendor/laravel/framework/src",
								},
							},
							stubs = {
								"bcmath",
								"bz2",
								"calendar",
								"Core",
								"curl",
								"date",
								"dom",
								"fileinfo",
								"filter",
								"gd",
								"hash",
								"iconv",
								"json",
								"libxml",
								"mbstring",
								"mcrypt",
								"mysql",
								"mysqli",
								"password",
								"pcntl",
								"pcre",
								"PDO",
								"pdo_mysql",
								"Phar",
								"posix",
								"readline",
								"Reflection",
								"session",
								"SimpleXML",
								"sockets",
								"sodium",
								"SPL",
								"standard",
								"superglobals",
								"tokenizer",
								"xml",
								"xdebug",
								"zip",
								"zlib",
								-- Framework/Plugin stubs
								"wordpress",
								"woocommerce",
								"acf-pro",
								"laravel",
								"lumen",
							},
							diagnostics = {
								enable = true,
							},
							completion = {
								fullyQualifyGlobalConstantsAndFunctions = true,
								insertUseDeclaration = true,
								triggerParameterHints = true,
								maxItems = 100,
							},
							phpdoc = {
								enable = true,
							},
							telemetry = {
								enabled = false, -- Disable telemetry
							},
							indexing = {
								excluded = {
									"**/vendor/**",
									"**/node_modules/**",
									"**/.git/**",
									"**/storage/**",
								},
							},
						},
					},
				})
			end,
		})
	end,
}
