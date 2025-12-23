return {
  "mason-org/mason.nvim",
  lazy = false, -- Mason is fundamental, load early
  config = function()
    require("mason").setup({
      ensure_installed = {
        "stylua",
        "typos_lsp", -- All
        "clangd", -- C & C++ -- For Lua formatting
        "clang-format", -- C & C++ formatter
      },
    })
  end,
}
