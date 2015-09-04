" Auto-Reload ~/.vimrc
augroup reload_vimrc " {
 autocmd!
 autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call pathogen#infect()

syntax on

set t_Co=256	" 256 Colors
set nocompatible	" Use Vim settings, rather then Vi settings (much better!).

filetype plugin on
set ofu=syntaxcomplete#Complete

" ================ General Config ====================
set title
" Update terminal window title
set visualbell		" Turn off sounds
set showmode		" Show the current mode
set showcmd		" Show incomplete commands
set autoread		" Reload files changed outside of vim
set ttyfast		" Use a fast terminal connection
set ruler	        " Show the line and column number of the cursor position
set backspace=indent,eol,start		" Allow backspace in insert mode
set laststatus=2					" Always show a status line
set encoding=utf-8				" Default character encoding
set scrolloff=3						" Start scrolling 3 lines from the bottom
set showtabline=2					" Always Show Tab Line
set number " Show Line Numbers"
set hidden
let mapleader=","					" Map leader from \ to ,

" ================ Indentation =======================
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set wrap " Wrap lines
set textwidth=79				" Width of text strings
set formatoptions=qrn1	" Set format options
set showbreak=↪
set expandtab

" ================ Completion ========================
set wildmode=list:longest
set wildmenu						" Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~			"stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif,*.pdf,*.psd

" ================ Searching =========================
set ignorecase					" Ignore case when searching
set smartcase						" Don't ignore case if search contains upper-case characters
set gdefault						" Substitude command (:s) always does global search
set incsearch						" Find the next match as we type the search
set hlsearch						" Highlight searches by default


" ================ Colors ============================
colorscheme solarized

" autocmd BufEnter * IndentGuidesEnable
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set background=dark
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

highlight LineNr ctermfg=235
highlight Comment ctermfg=236
highlight Pmenu ctermfg=lightgrey ctermbg=234
highlight PmenuSel ctermfg=white ctermbg=darkgrey
highlight clear SpellBad

" ================ Plugins ===========================
" SuperTab
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabClosePreviewOnPopupClose = 1

" delimitMate
" au FileType php let delimitMate_matchpairs = "(:),[:],{:}"

" CloseTag
" autocmd FileType html,htmldjango,jinjahtml,eruby,ruby,mako let b:closetag_html_style=1
" autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,ruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" CTags
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width = 40
let g:tagbar_type_php  = {'ctagstype' : 'php', 'kinds' : [ 'i:interfaces', 'c:classes', 'd:constant definitions', 'f:functions' ] }
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd BufEnter * nested :call tagbar#autoopen(0)

noremap <silent> <leader>/ :TagbarToggle<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['php', 'ruby'], 'passive_filetypes': ['c','h','cpp'] }

" Remember Last Position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
 autocmd!
 autocmd BufWinEnter * call ResCur()
augroup END

" ================ Remapping =========================
" " Navigate rows rather than lines
nnoremap <down> gj
nnoremap <up> gk

" Write/quit fixes
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Fix keycodes
" imap  <Home>
" imap  <End>

" tabs
map } gt
map { gT

" Reselect visual block after indenting
vmap > > gv
vmap < < gv

" ================== Ctrl+P Settings =================
let g:ctrlp_map = '<c-t>'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](bower_components|node_modules|\.git|\.hg|\.svn)$', 'file': '\v\.(exe|so|dll|swp)$' }
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'] }

" =================== Misc Settings ==================
nnoremap <leader>g :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" =================== Jamie Settings =================

" encoding is utf 8
set fileencoding=utf-8

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" Ctrl-p fuzzy search settings
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

" Emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" show matching brackets
set showmatch
set mat=2

" react JSX highlighting
let g:jsx_ext_required = 0

" Search tweaks
" command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]

" Customize tagbar for go
let g:tagbar_type_go = {  
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

