return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "┊", 
      },
      scope = {
        enabled = true,
        char = "│",
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "mason",
          "TelescopePrompt",
          "DressingInput",
          "neo-tree",
          "NvimTree",
          "Trouble",
          "checkhealth",
          "which-key",
          "dashboard",
        },
        buftypes = { "nofile", "prompt", "quickfix" },
      },
    })
  end,
}
