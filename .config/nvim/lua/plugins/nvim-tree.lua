return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			local function create_dir()
				local node = api.tree.get_node_under_cursor()
				local path = node.absolute_path
				if node.type ~= "directory" then
					path = vim.fn.fnamemodify(path, ":h")
				end
				vim.ui.input({ prompt = "Create Directory: " }, function(name)
					if not name or name == "" then
						return
					end
					local full_path = path .. "/" .. name
					vim.fn.mkdir(full_path, "p")
					api.tree.reload()
				end)
			end

			-- custom mappings
			vim.keymap.set("n", "A", create_dir, opts("Create Directory"))
			vim.keymap.set("n", "a", api.fs.create, opts("Create File/Dir"))
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			sort_by = "case_sensitive",
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			diagnostics = {
				enable = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			system_open = {
				cmd = nil,
			},
		})

		-- Keybindings for nvim-tree
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
