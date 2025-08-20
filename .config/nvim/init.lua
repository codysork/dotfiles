-- init.lua

-- Set options
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Number of spaces for indentation
vim.opt.tabstop = 4            -- Number of spaces a tab counts for
vim.opt.smartindent = true      -- Smart indentation

require("config.lazy")

-- Telekasten Settings
require('telekasten').setup({
  home = vim.fn.expand("~/Sync/CodyVault"), -- Put the name of your notes directory here
})

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
