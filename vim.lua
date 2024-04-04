vim.cmd [[
  colorscheme catppuccin
  let g:pencil#textwidth = 75
  syntax = on
  hi BufferLineBackground guibg=#1e1e2e
  hi BufferLineBackground guifg=#585b70
  hi BufferLineCloseButton guibg=#1e1e2e
  hi BufferLineCloseButton guifg=#585b70
  hi BufferLineNumbers guibg=#1e1e2e
  hi BufferLineNumbers guifg=#585b70

  hi BufferLineBufferSelected guifg=#cdd6f4
  hi BufferLineBufferSelected guibg=#313244
  hi BufferLineCloseButtonSelected guifg=#cdd6f4
  hi BufferLineCloseButtonSelected guibg=#313244
  hi BufferLineNumbersSelected guifg=#cdd6f4
  hi BufferLineNumbersSelected guibg=#313244

  hi VertSplit guifg=#9dd7e5

  set nocompatible
  filetype plugin on       " may already be in your .vimrc

  set iskeyword+=-
  set whichwrap+=<,>,[,],h,l

  hi clear SpellBad
  hi SpellBad cterm=underline
  hi SpellBad gui=undercurl

  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in sessionet

  let g:goyo_width = 80 
  let g:goyo_height = 40

  augroup litecorrect
	autocmd!
	autocmd FileType text,txt,markdown,md call litecorrect#init()
  augroup END

  augroup lexical
	autocmd!
	autocmd FileType markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
  augroup END

  augroup pandoc_syntax
	  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  augroup END

  autocmd BufEnter * silent! lcd %:p:h

  function! s:goyo_enter()
	set noshowmode
	set noshowcmd
	set scrolloff=999
	lua require('lualine').hide()
  endfunction

]]
