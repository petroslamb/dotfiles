nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-H><C-H>
nnoremap <C-J> <C-L><C-L>

set tabstop=4
set encoding=utf8

set splitbelow
set splitright
set mousefocus

colorscheme koehler

set textwidth=1079  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " an hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

au FileType json setlocal equalprg=python\ -m\ json.tool

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set mouse=a

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" :noremap ; :
" :noremap : ;

" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double quote a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
" nnoremap wq :silent! normal mpeld bhd `ph<CR>


set laststatus=2
set statusline=%f "tail of the filename
set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

set cursorline

set wildchar=<Tab> wildmenu wildmode=full
:nnoremap <F9> :buffers<CR>:buffer<Space>

:set tags=~/mytags
:set tags=tags;/
" set autochdir
set foldnestmax=1
set foldmethod=indent

set textwidth=100
set t_Co=256
" hi ColorColumn ctermfg=7 ctermbg=9 guifg=LightGrey guibg=DarkGrey
set autoread
set wrap linebreak nolist
" set formatoptions=tcql
set formatoptions=l


"
" Much improved auto completion menus
"
set completeopt=menuone,longest,preview
"
" Use C-space for omni completion in insert mode.
"
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


"
" Typescript - autocompletion via typescript-tools plugin
" and custom Makefile-based builds...
"
let $PATH .= ':' . $HOME . '/.vim/bundle/typescript-tools/bin'
set rtp+=$HOME/.vim/bundle/typescript-tools/
au BufNewFile,BufRead *.ts call SetupTSEnviron()
function! SetupTSEnviron()
setlocal filetype=typescript
se makeprg=make
nnoremap <buffer> <F8> :TSSstarthere<CR>
nnoremap <buffer> <F7> :make<CR>
nnoremap <buffer> <C-]> :TSSdef<CR>
nnoremap <buffer> \t :TSSsymbol<CR>
set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
endfunction

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:pymode_options_colorcolumn=0

