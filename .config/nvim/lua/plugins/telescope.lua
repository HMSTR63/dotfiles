return {
  {
    'nvim-telescope/telescope.nvim', 
    -- tag = '0.1.6', -- REMOVED: Using fixed version caused compatibility issues with Treesitter
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- NOTE: Using <leader>f and <leader>g conflicts with LazyVim defaults (<leader>ff, <leader>gl)
      -- I have commented these out. Use LazyVim defaults:
      -- <leader>ff : Find Files
      -- <leader>sg : Live Grep (Search Grep)
      
      -- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      -- vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("noice")
    end
  }
}
