return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash", "c", "css", "html", "javascript", "json", "lua", "luadoc",
      "markdown", "markdown_inline", "python", "query", "regex", "tsx",
      "typescript", "vim", "vimdoc", "yaml"
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
