return {
  "windwp/nvim-autopairs",
  event = "InsertCharPre",
  config = function()
    require("nvim-autopairs").setup({
      -- Options go here, or leave empty for default behavior
      check_ts = true, -- enable tree-sitter
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "javascript" },
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {},
      -- You can add custom rules
      -- map_cr = true,
    })
  end,
}
