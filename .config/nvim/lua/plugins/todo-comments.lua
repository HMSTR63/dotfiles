return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
     require("todo-comments").setup()
  end,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
