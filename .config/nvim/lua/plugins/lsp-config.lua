return {
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

            -- Customizing how diagnostics are displayed
            vim.diagnostic.config({
                virtual_text = true, -- Show the error message inline
                signs = true, -- Show signs in the gutter
                underline = true, -- Underline the error
                update_in_insert = false, -- Update diagnostics while typing (can be distracting if true)
                severity_sort = true, -- Sort by severity (errors first)
            })

            -- Change the Diagnostic symbols in the sign column (gutter)
            local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

			-- Setup common keymaps for LSPs
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover Documentation" })
				-- Use Telescope for Go to Definition/References if available
				local telescope_builtin = require('telescope.builtin')
				vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, { buffer = bufnr, desc = "LSP: Go to Definition" })
				vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { buffer = bufnr, desc = "LSP: Find References" })
				
				vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "LSP: Go to Definition" })
				vim.keymap.set("n", "<M-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "LSP: Go to Definition" })
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to Definition" })
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: Find References" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code Action" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP: Rename" })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to previous diagnostic" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to next diagnostic" })

				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
					end, { buffer = bufnr, desc = "LSP: Toggle Inlay Hints" })
				end
			end

			-- Use mason-lspconfig to set up servers
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"ts_ls",
					"html",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"pyright",
					"gopls",
					"rust_analyzer",
					"jsonls",
					"yamlls",
				}, -- Add other LSPs you want Mason to install and manage here
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
						})
					end,
                    ["clangd"] = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            cmd = { "clangd", "--offset-encoding=utf-16" }, -- explicit command with offset fix
                            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                            root_dir = function(fname)
                                return require("lspconfig.util").root_pattern(
                                    ".clangd",
                                    ".clang-tidy",
                                    ".clang-format",
                                    "compile_commands.json",
                                    "compile_flags.txt",
                                    "configure.ac",
                                    ".git"
                                )(fname) or vim.fn.getcwd()
                            end,
                            init_options = {
                                usePlaceholders = true,
                                completeUnimported = true,
                                clangdFileStatus = true,
                            },
                        })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    runtime = {
                                        version = "LuaJIT",
                                    },
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true),
                                    },
                                    telemetry = {
                                        enable = false,
                                    },
                                    hint = {
                                        enable = true,
                                    },
                                },
                            },
                        })
                    end,
				},
			})
		end,
	},
}