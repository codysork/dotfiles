require("config.lazy")

-- Appearance
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Telekasten
require('telekasten').setup({
  home = vim.fn.expand("~/Sync/CodyVault"), -- Put the name of your notes directory here
})
