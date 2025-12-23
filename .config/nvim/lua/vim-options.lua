vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.shiftwidth = 4 -- Indent/outdent by 4 spaces
vim.opt.expandtab = true -- Use tabs instead of spaces
vim.opt.autoindent = true -- Always set autoindenting
vim.opt.smartindent = true -- Smart indenting for C-like languages

vim.opt.number = true -- Show current line number
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.mouse = 'a' -- Enable mouse support

vim.g.mapleader = " "
vim.g.user = "sojammali"
vim.g.mail = "sojammali1337@gmail.com"
vim.opt.clipboard:append("unnamedplus")

-- Maintain 8 lines above/below cursor when scrolling for smoother experience
vim.opt.scrolloff = 8

-- Disable unused providers to silence health check warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })


