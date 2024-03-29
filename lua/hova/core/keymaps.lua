-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local api = vim.api -- for conciseness


---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "`", "<ESC>")
keymap.set("n", "`", "<ESC>")
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- paste your last yank 
keymap.set("n", "<leader>p", '"0p')  
keymap.set("n", "<leader>P", '"0P') 

-- quick save and quit
keymap.set("n", "<leader>w", ":w<CR>") 
keymap.set("n", "<leader>q", ":q<CR>") 
keymap.set("n", "<leader>wq", ":wq<CR>") 

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- gitsigns
   -- Navigation
keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
keymap.set('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
keymap.set('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

-- nvim-ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- copilot chat
keymap.set("n", "<leader>ch", ":CopilotChat ") -- toggle file explorer

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
