return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 14,
			open_mapping = false, -- We use a custom mapping below
			hide_numbers = true,
			direction = "float", -- 'float', 'horizontal', 'vertical'
			terminal_mappings = true,
			-- Change these according to your needs
			float_opts = {
				border = "curved",
				winblend = 0,
				height = math.floor(vim.o.lines * 0.9), -- 90% of screen height
				width = math.floor(vim.o.columns * 0.9), -- 80% of screen width
				row = nil,
				col = nil,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local float_term = Terminal:new({ direction = "float", hidden = true })

		function _G.toggle_float_term_in_cwd()
			local new_cwd = vim.fn.expand("%:p:h")
			if new_cwd == "" or vim.fn.isdirectory(new_cwd) == 0 then
				new_cwd = vim.fn.getcwd()
			end

			-- if the terminal is already open, we're just toggling it off
			if float_term:is_open() then
				float_term:toggle()
				return
			end

			-- if the terminal process is running, cd to the new directory
			if float_term.pid then
				float_term:send("cd " .. vim.fn.fnameescape(new_cwd), true)
			else
				-- if the process doesn't exist, set the cwd for the new process
				float_term.spawn_opts = { cwd = new_cwd }
			end

			float_term:toggle()
		end

		vim.keymap.set(
			{ "n", "t" },
			"<C-t>",
			"<cmd>lua _G.toggle_float_term_in_cwd()<CR>",
			{ noremap = true, silent = true }
		)

		-- Keybindings for specific terminals (optional, can be added later)
		-- function _G.set_terminal_keymaps()
		--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], {noremap = true})
		--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], {noremap = true})
		--   vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-h>]], {noremap = true})
		--   vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-j>]], {noremap = true})
		--   vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-k>]], {noremap = true})
		--   vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-l>]], {noremap = true})
		-- end
		--
		-- vim.cmd('autocmd TermOpen term://* lua set_terminal_keymaps()')
	end,
}

