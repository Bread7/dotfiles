-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
opts.desc = "Core: Save file"
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
opts.desc = "Core: Save file without auto-formatting"
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
opts.desc = "Core: Write and quit file"
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
opts.desc = "Core: Delete single char without copying into register"
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
opts.desc = "Core: Scroll up and center"
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
opts.desc = "Core: Scroll down and center"
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
opts.desc = "Core: Find next and center"
vim.keymap.set("n", "n", "nzzzv", opts)
opts.desc = "Core: Find previous and center"
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
opts.desc = "Core: Resize buffer upwards"
vim.keymap.set("n", "<leader><Up>", ":resize -2<CR>", opts)
opts.desc = "Core: Resize buffer downwards"
vim.keymap.set("n", "<leader><Down>", ":resize +2<CR>", opts)
opts.desc = "Core: Resize buffer right"
vim.keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>", opts)
opts.desc = "Core: Resize buffer right"
vim.keymap.set("n", "<leader><Right>", ":vertical resize +2<CR>", opts)

-- Buffers
opts.desc = "Core: Open next buffer"
vim.keymap.set("n", "<leader>]", ":bNext<CR>", opts)
opts.desc = "Core: Open previous buffer"
vim.keymap.set("n", "<leader>[", ":bprevious<CR>", opts)
opts.desc = "Core: Close current buffer"
vim.keymap.set("n", "<leader>B", ":bdelete!<CR>", opts) -- close buffer
opts.desc = "Core: Open new buffer"
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
opts.desc = "Core: Split window vertically"
vim.keymap.set("n", "<leader>\\", "<C-w>v", opts) -- split window vertically
opts.desc = "Core: Split window horizontally"
vim.keymap.set("n", "<leader>|", "<C-w>s", opts) -- split window horizontally
opts.desc = "Core: Make split windows equal width & height"
vim.keymap.set("n", "<leader>we", "<C-w>=", opts) -- make split windows equal width & height
opts.desc = "Core: Close window"
vim.keymap.set("n", "<leader>W", ":close<CR>", opts) -- close current split window

-- Navigate between splits
opts.desc = "Core: Focus up window"
vim.keymap.set("n", "<C-K>", ":wincmd k<CR>", opts)
opts.desc = "Core: Focus down window"
vim.keymap.set("n", "<C-J>", ":wincmd j<CR>", opts)
opts.desc = "Core: Focus left window"
vim.keymap.set("n", "<C-H>", ":wincmd h<CR>", opts)
opts.desc = "Core: Focus right window"
vim.keymap.set("n", "<C-L>", ":wincmd l<CR>", opts)

-- Tabs
opts.desc = "Core: Open new tab"
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opts) -- open new tab
opts.desc = "Core: Close current tab"
vim.keymap.set("n", "<leader>T", ":tabclose<CR>", opts) -- close current tab
opts.desc = "Core: Focus next tab"
vim.keymap.set("n", "<leader>}", ":tabn<CR>", opts) --  go to next tab
opts.desc = "Core: Focus previous tab"
vim.keymap.set("n", "<leader>{", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
opts.desc = "Core: Toggle line wrapping"
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
opts.desc = "Core: Indent left"
vim.keymap.set("v", "<", "<gv", opts)
opts.desc = "Core: Indent right"
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
opts.desc = "Core: Keep last yanked when pasting"
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
