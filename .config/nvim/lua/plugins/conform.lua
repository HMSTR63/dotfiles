return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>ff",
      function()
        require("conform").format({ async = true, lsp_format = "sync" })
      end,
      mode = { "n", "x" },
      desc = "Format file or range (conform)",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    formatters = {
      clang_format = {
        prepend_args = { "--style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100, BreakBeforeBraces: Allman}" },
      },
    },
    -- format_on_save REMOVED to fix LazyVim warning
  },
}
