return {
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      stiffness = 0.4, -- Default: 0.6
      trailing_stiffness = 0.3, -- Default: 0.45
      damping = 0.98, -- Default: 0.85

      -- Optional: also adjust for insert mode
      stiffness_insert_mode = 0.4, -- Default: 0.5
      trailing_stiffness_insert_mode = 0.3, -- Default: 0.5
      damping_insert_mode = 0.98, -- Default: 0.9

      -- Other options for enhanced smear effect
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      smear_insert_mode = true,
    },
  },
  {
    "nvim-mini/mini.animate",
    config = function()
      require("mini.animate").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "vyfor/cord.nvim",
    config = function()
      require("cord").setup({
        -- Your configuration here
      })
    end,
  },
}
