--------------------------------------------------------------------------
--                            BOILERPLATE                               --
--------------------------------------------------------------------------

require("config.lazy")

--------------------------------------------------------------------------
--                             Appearance                               --
--------------------------------------------------------------------------

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

--------------------------------------------------------------------------
--                              Defaults                                --
--------------------------------------------------------------------------

vim.g.mapleader = ","
vim.opt.clipboard = "unnamedplus"

--------------------------------------------------------------------------
--                             Telekasten                               --
--------------------------------------------------------------------------

require('telekasten').setup({
  -- Put the name of your notes directory here
  home = vim.fn.expand("~/Sync/CodysNewVault"), 
})

-- Mneumonic: z for zettlekasten
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")  -- b for backlinks
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")   -- c for calendar
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")      -- d for day
vim.keymap.set("n", "<leader>ze", "<cmd>Telekasten follow_link<CR>")     -- e for explore
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")      -- f for find
vim.keymap.set("n", "<leader>zi", "<cmd>Telekasten insert_img_link<CR>") -- I for insert image
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")        -- n for new note
vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>")    -- s for search

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

