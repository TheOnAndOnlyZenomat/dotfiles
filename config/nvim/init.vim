set number
syntax on
set autoindent
set showmatch
set incsearch
set hlsearch
set backspace=eol,start,indent
set paste
set guicursor=

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'morhetz/gruvbox'
  Plug 'ap/vim-css-color'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'farmergreg/vim-lastplace'

call plug#end()"Config Section

noremap jj <esc>

"dont change cursor
set guicursor=

"Nerdtree
let g:NERDTreeShowHidden = 1

let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Goyo
autocmd BufReadPost *.md silent! Goyo
ca wq :w<cr>:call Quit()<cr>
ca q :call Quit()<cr>
function! Quit()
    if exists('#goyo')
        Goyo
    endif
    quit
endfunction

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" auto recompile documents on write
autocmd BufWritePost ~/school/12/grw/wirtschaft.md !cd ~/school/12/grw/; pandoc wirtschaft.md -o wirtschaft.pdf
autocmd BufWritePost ~/school/12/Astro/das.md !cd ~/school/12/Astro/; pandoc das.md -o das.pdf
autocmd BufWritePost ~/school/12/Deutsch/literatur-jahrhundertwende.md !cd ~/school/12/Deutsch/; pandoc literatur-jahrhundertwende.md -o literatur-jahrhundertwende.pdf
autocmd BufWritePost ~/school/12/Englisch/science-and-tech.md !cd ~/school/12/Englisch/; pandoc science-and-tech.md -o science-and-tech.pdf
autocmd BufWritePost ~/school/12/Deutsch/strafkolonie-realismus.md !cd ~/school/12/Deutsch/; pandoc strafkolonie-realismus.md -o strafkolonie-realismus.pdf
