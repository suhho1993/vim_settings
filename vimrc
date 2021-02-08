syntax on

if has ("gui_running")
    set background=dark
    colorscheme solorized
    set guioptions -=T "Delete Tool bar"
    set guioptions -=r "Delete Scroll"
endif
"color hybrid

set t_Co=256
set number
set hlsearch
set ruler
set ignorecase
set showcmd
set wildmenu
set smartindent
set cindent
set laststatus=2
set tabstop=4
set showmatch
set fileencodings=utf-8,euc-kr
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set nowrap
set nobackup
set showcmd
set nocompatible
set ruler

" backup dirctory
set directory=~/.vim/.vim_swp/
set backupdir=~/.vim/.vim_swp/
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
     Plugin 'gmarik/Vundle.vim'
     Plugin 'tpope/vim-fugitive'
     Plugin 'L9'
     "Plugin 'git://git.wincent.com/command-t.git'
     Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
     "Plugin 'user/L9', {'name': 'newL9'}
     Plugin 'The-NERD-tree'
     Plugin 'taglist-plus'
     Plugin 'SrcExpl'
     Plugin 'AutoComplPop'
     Plugin 'pathogen.vim'
     Plugin 'Syntastic'
     Plugin 'Tagbar'
     Plugin 'vim-airline/vim-airline'
     Plugin 'Auto-Pairs'
call vundle#end()
filetype plugin indent on
"=== NERD-tree setting ==="
nmap <F7> :NERDTreeToggle<CR>

"=== cscope ===

Plugin 'ronakg/quickr-cscope.vim'

set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
else
    cs add /usr/src/linux/cscope.out
endif

set csverb
"==============================================

"=== Taglist setting ==="
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1
"nmap <F6> :Tlist<CR>


"=== SrcExplorer setting ==="
nmap <F9> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight=8
let g:SrcExpl_refreshTime=100
let g:SrcExpl_jumpkey="<ENTER>"
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_pluginList=["__Tag_List__","_NERD_tree_","Source_Explorer"]
let g:SrcExpl_searchLocalDef=1
let g:SrcExpl_isUpdateTags=0
let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey="<F12>"


"==== Syntastic setting ===
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" 1 : always
let g:syntastic_auto_loc_list = 2
let g:syntastic_c_config_file=".syntastic_c_config"
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F10> :Errors<CR>
nmap <F11> :lclose<CR>


"=== Tagbar seting ===
nmap <F8> :TagbarToggle<CR>

"===== 주석 매크로 =====
func! CmtOn_v1()    "주석\\  on ctrl+c
    exe "'<,'>norm i//"
endfunc

func! CmtOff()    "주석 \\ off ctrl+x
    exe "'<,'>norm 2x"
endfunc

func! CmtOn_v2()
    exe "'<,'>norm i##"
endfunc

vmap <c-c> <esc>:call CmtOn_v1() <cr>
vmap <c-x> <esc>:call CmtOff() <cr>
nmap <c-c> <esc>v:call CmtOn_v1() <cr>
nmap <c-x> <esc>v:call CmtOff() <cr>

vmap <c-b> <esc>:call CmtOn_v2() <cr>
nmap <c-b> <esc>v:call CmtOn_v2() <cr>


"=== NOTE setting ====
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
        autocmd Syntax * call matchadd('Search', '\W\zs\(HELP\|DEBUG\)')
        autocmd Syntax * call matchadd('ErrorMsg', '\W\zs\(ERROR\|FATAL\)')
    endif
endif



"-----------------------------------------------
set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags


autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif"`'")"'")

" 라인 끝 공백 highlight
highlight ExtraWhitespace ctermbg=88
match ExtraWhitespace /\s\+$/

set laststatus=2 " vim-airline을 위해 상태바 2줄
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline#extensions#tabline#left_sep = ' ' " ~
let g:airline#extensions#tabline#left_alt_sep = '|' " tabline
let g:airline#extensions#tabline#formatter = 'unique_tail' " buffer format

" 자동완성 기능
let g:neocomplcache_enable_at_startup = 1

" gitgutter
highlight GitGutterAdd    guifg=#009900 ctermfg=10
highlight GitGutterChange guifg=#bbbb00 ctermfg=11
highlight GitGutterDelete guifg=#ff2222 ctermfg=9
