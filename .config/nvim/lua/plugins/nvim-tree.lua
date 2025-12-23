return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
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
		vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

		-- Additional keymaps for file operations
		vim.api.nvim_set_keymap("n", "R", ":NvimTreeRename<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "a", ":NvimTreeCreate<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-a>", ":NvimTreeCreateDirectory<CR>", { noremap = true, silent = true })
	end,
}
