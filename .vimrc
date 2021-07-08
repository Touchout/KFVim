set nocompatible              " be iMproved, required
"filetype off                  " required

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'majutsushi/tagbar'
"Plugin 'webdevel/tabulous' 
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'Yggdroot/LeaderF'

"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line

call plug#begin('~/.vim/plugged')
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe', { 'on': [] } "don't load YCM at startup, but on demand
Plug 'majutsushi/tagbar'
Plug 'webdevel/tabulous'
Plug 'scrooloose/nerdcommenter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/LeaderF'

" Initialize plugin system
call plug#end()

"General settings
"set ttymouse=xterm2
"set mouse=a
syntax enable
set nu
set ai
set cursorline
"highlight CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
filetype plugin indent on 
set splitbelow
set splitright
set encoding=utf-8
set t_Co=256
"colorscheme sublimemonokai
set foldcolumn=1
set switchbuf=usetab,newtab

"custom highilight
hi LineNr cterm=bold ctermfg=LightGrey ctermbg=NONE
hi Search ctermfg=black
hi Visual ctermbg=236
hi Statement ctermfg=226
hi Folded ctermbg=238
hi FoldColumn ctermbg=238
hi DiffAdd ctermfg=0   
hi DiffChange ctermfg=0
hi DiffDelete ctermfg=0
hi DiffText ctermfg=0


"for vim-cpp-enhanced-highlight
let g:cpp_class_decl_highlight = 1

"command mapping
command! CDC cd %:p:h

"statusline
set laststatus=2

"make backspce work correctly
set backspace=indent,eol,start


"Paste correction
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

"Netrw settings
"nmap <F9> :Vex<CR><CR>
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 25

"Ctags
"This will check the current folder for tags file and keep going one directory up all the way to the root folder. So you can be in any sub-folder in your project and it'll be able to find the tags files.
set tags=tags;/

"Search highlight toggle
nmap <F7> :set hlsearch!<CR>
nnoremap <F8> :let @/='\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>

"Taglist settings
"nmap <F9> :TlistToggle<CR><CR>
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"set ut=100

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F10> :TagbarToggle<CR>

"Cscope settings
if has("cscope")
	set csprg=/grid/common/pkgs/cscope/v15.8b/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif


nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>

"YCM settings
command YcmLoad call plug#load('YouCompleteMe')
let g:ycm_server_python_interpreter='/grid/common/pkgs/python/v3.7.2/bin/python3'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"force disable semantic triggers (e.g. after '.', '->'), it might be very slow
"due to server issue
"let g:ycm_semantic_triggers={}
"let g:ycm_clangd_binary_path = "~/.ycm_llvm_8.0.0/bin/clangd"

"Blank line insertion
nnoremap <silent> j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> k :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Tab navigation
nnoremap gr :tabprevious<CR>
nnoremap gh :tabprevious<CR>
nnoremap gl :tabnext<CR>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> gg :exe "tabn ".g:lasttab<cr>
nnoremap , :tabm-<CR>
nnoremap . :tabm+<CR>

"
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"inoremap <C-u> <C-o>u
"<C-i> is actually <Tab>, don't map it to avoid affect tab function
"inoremap <C-i> <C-o>e
inoremap <C-d> <Del>

"Navigation mapping
nnoremap <C-l> w
nnoremap <C-H> b
nnoremap L 10l
nnoremap H 10h
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap J 5j
nnoremap K 5k
nnoremap h ^
nnoremap l $

"p4 operation
nnoremap e :!p4 edit %<CR>

"visual mode mapping
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap J 5j
vnoremap K 5k
vnoremap L 10l
vnoremap H 10h

"CtrlP settings
"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = {
 "\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
 "\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
 "\ }
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=20
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g:ctrlp_follow_symlinks=1

""Ctrlp-funky settings
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
"nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"let g:ctrlp_funky_syntax_highlight = 1
"let g:ctrlp_extensions = ['funky']

"LeaderF settings
map <leader>p :Leaderf file<CR>
map <leader>f :Leaderf mru<CR>
map <leader>fu :Leaderf function<CR>
map <leader>s :Leaderf line<CR>
map <leader>t :Leaderf tag --cword<CR>
map <F9> :Leaderf buffer<CR>

"Bufferlist settings
map <silent> <Leader>b :call BufferList()<CR>
let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50
hi BufferSelected term=reverse ctermfg=black ctermbg=grey cterm=bold
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE
