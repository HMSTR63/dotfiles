return {
  'magicduck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- options
    });
  end,
  keys = {
    { "<leader>rr", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } }) end, desc = "Search and replace current word" },
  }
}
