local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("n", "<A-H>", "<C-w>H", opts)
keymap("n", "<A-J>", "<C-w>J", opts)
keymap("n", "<A-K>", "<C-w>K", opts)
keymap("n", "<A-L>", "<C-w>L", opts)
keymap("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>", opts)


-- Center Cursor
keymap("n", 	"j", 			"jzz", opts)
keymap("n", 	"k", 			"kzz", opts)
keymap("n", 	"gg", 			"ggzz", opts)
keymap("n", 	"G", 			"Gzz", opts)
keymap("n", 	"n", 			"nzz", opts)
keymap("n", 	"N", 			"Nzz", opts)
keymap("v", 	"j", 			"jzz", opts)
keymap("v", 	"k", 			"kzz", opts)
keymap("n", 	"o", 			"o<ESC>zz", opts)

-- Other handy maps
keymap("n", 	"L", 			"$", 	opts)
keymap("n", 	"H", 			"0", 	opts)
keymap("v", 	"L", 			"$", 	opts)
keymap("v", 	"H", 			"0", 	opts)
keymap("n",		"dL",			"d$", 	opts)
keymap("n",		"dH",			"d0", 	opts)
keymap("n", 	"<leader>q", 	":bd<CR>", opts)

-- Plugin Launching
keymap("n", "<leader>e", ":ex .<CR>", opts)
keymap("n", "<leader>u", ":UndotreeToggle <CR>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":FzfLua files<CR>", opts)
keymap("n", "<leader>h", ":FzfLua oldfiles<CR>", opts)
keymap("n", "<leader>m", ":MarkdownPreviewToggle<CR>", opts)
keymap("n", "<leader>p", ":PencilHard<CR>", opts)
keymap("n", "<C-#>", 	 ":CommentToggle<CR>", opts)

-- Insert --
-- Press hk fast to enter
keymap("i", "hk", "<ESC>", opts)
keymap("v", "hk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<C-#>", ":CommentToggle<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode --
-- Escape from Terminal using hk --
keymap("n", "<leader>t", ":12split term://xonsh<CR>", opts)
keymap("t", "hk", "<C-\\><C-n>", opts)
