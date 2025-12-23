return {
  "olimorris/persisted.nvim",
  config = function()
    require("persisted").setup({
      -- Your configuration here, or leave empty for defaults
      autosave = true,
      dirs = {
        -- List directories to persist, e.g., current working directory
        -- vim.fn.expand("~/.config/nvim/session"),
      },
      -- Example keymaps:
      -- vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>PersistedSave<CR>", { noremap = true, silent = true, desc = "Save Session" }),
      -- vim.api.nvim_set_keymap("n", "<leader>sl", "<cmd>PersistedLoad<CR>", { noremap = true, silent = true, desc = "Load Last Session" }),
      -- vim.api.nvim_set_keymap("n", "<leader>sd", "<cmd>PersistedDelete<CR>", { noremap = true, silent = true, desc = "Delete Session" }),
    })
  end,
}
