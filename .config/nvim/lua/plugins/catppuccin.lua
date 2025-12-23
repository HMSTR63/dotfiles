return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        toggleterm = true,
      },
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = colors.surface1 },
        }
      end,
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
