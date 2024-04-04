local options = {
  autoindent 	= 	true,                      -- automatically indents
  autochdir		= 	true,
  backup 		= 	false,                     -- creates a backup file
  belloff 		= 	"all",
  binary 		= 	true,
  clipboard 	= 	"unnamedplus",             -- allows neovim to access the system clipboard
  cmdheight 	= 	1,                         -- more space in the neovim command line for displaying messages
  completeopt 	= 	{ "menuone", "noselect" }, -- mostly just for cmp
  conceallevel 	= 	0,                         -- so that `` is visible in markdown files
  confirm 		= 	true,
  cursorline 	= 	true,
  cursorlineopt	= 	"number",
  errorbells 	= 	true,
  fileencoding 	= 	"utf-8",                   -- the encoding written to a file
  foldclose		=	"all",
  foldmethod 	= 	"marker",
  guifont		=	"JetBrains Mono:h12:b",
  hlsearch		= 	false,
  hidden		= 	true,
  ignorecase 	= 	true,                      -- ignore case in search patterns
  incsearch 	= 	true,
  mouse 		= 	"a",                       -- allow the mouse to be used in neovim
  number 		= 	true,                      -- set numbered lines
  numberwidth 	= 	4,                         -- set number column width to 2 {default 4}
  pumheight 	= 	10,                        -- pop up menu height
  relativenumber= 	true,                      -- set relative numbered lines
  scrolloff 	= 	8,                         -- is one of my fav
  shiftwidth 	= 	2,                         -- the number of spaces inserted for each indentation
  showmode 		= 	false,                     -- we don't need to see things like -- INSERT -- anymore
  showtabline 	= 	1,                         -- always show tabs
  sidescrolloff	= 	8,
  signcolumn 	= 	"auto",                     -- always show the sign column, otherwise it would shift the text each time
  smartcase 	= 	true,                      -- smart case
  smartindent 	= 	true,                      -- make indenting smarter again
  spell 		= 	true,
  spelllang 	= 	"en_gb",
  splitbelow 	= 	true,                       -- force all horizontal splits to go below current window
  splitright 	= 	true,                       -- force all vertical splits to go to the right of current window
  syntax		=	'on',
  swapfile 		= 	false,                      -- creates a swapfile
  tabstop 		= 	4,                          -- insert 2 spaces for a tab
  timeoutlen 	= 	1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile 		= 	true,                       -- enable persistent undo
  updatetime 	= 	300,                        -- faster completion (4000ms default)
  writebackup 	= 	false,                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap 			= 	false,                      -- display lines as one long line
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

