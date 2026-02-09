return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  lazy = false, -- Mason is fundamental, load early
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "clang-format",
        "prettier",
        "black",
        "isort",
        "hadolint",
        "eslint_d",
      },
    })
  end,
}
