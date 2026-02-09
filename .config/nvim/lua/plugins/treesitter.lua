return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash", "c", "css", "dockerfile", "go", "gomod", "html", "java", "javascript", "json", "lua", "luadoc",
      "markdown", "markdown_inline", "python", "query", "regex", "rust", "toml", "tsx",
      "typescript", "vim", "vimdoc", "yaml"
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
