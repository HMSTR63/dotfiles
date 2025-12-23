return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>n", group = "Noice" },
      { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss All" },
      { "<leader>nh", "<cmd>Noice history<cr>", desc = "History" },
      { "<leader>nl", "<cmd>Noice last<cr>", desc = "Last Message" },
      { "<leader>ns", "<cmd>Telescope noice<cr>", desc = "Search" },
    },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}
