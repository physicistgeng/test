"general settings
" Enable the true color
if (has("termguicolors"))
 set termguicolors
endif

"Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set fileencoding=utf-8
set nopaste
" keep 3 lines when scrolling"
set scrolloff=3
set shiftround

" 设置当文件被改动时自动载入
set autoread
"共享剪贴板  
""set clipboard+=unnamed 
set clipboard=unnamed 
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
set relativenumber
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set ttyfast "should make scrolling faster
set lazyredraw "same as above

"mapping settings
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "

" === Cursor Movement
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

""my shotcut key settings ***************************************
map ` :!python %<CR>
""set a map for esc 
inoremap jj <ESC>
"xmap jj <ESC>
""set a map for python docstring 
inoremap ** """<space><space>"""<ESC>3hi

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" Disable the default s key
noremap s <nop>
" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

"neovim python provider
let g:python3_host_prog  = '/Users/gengjiwei/anaconda3/bin/python3'

"load the plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line cu to cancle commnet
"Plug 'itchyny/vim-cursorword'
"Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'mbbill/undotree/'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jpalardy/vim-slime'
"Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhinz/vim-startify'
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'itchyny/lightline.vim'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'ajmwagar/vim-deus'
"Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
colorscheme gruvbox
"colorscheme deus
"colorscheme onedark
"colorscheme tender
"colorscheme dracula
syntax on           " 语法高亮  

"nerdtree
map mm :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.__pycahe--', 'tags']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" FZF file finder
map <c-p> :FZF
"Semshi rename
map <c-r> :Semshi rename<CR>


"plugin settings
"let g:airline_theme='gruvbox'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#coc#enabled = 1 

"lightline
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }

let g:lightline = {
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ }

let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
"===
" === coc
" ===
" fix the most annoying bug that coc has
"autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
" use <tab> for trigger completion and navigate to the next complete item
" Installing plugins
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-translator']
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap cd :CocList diagnostics<CR>
nmap cp :CocCommand python.setInterpreter<CR>
noremap ,l :sp<CR><C-w>j:term ipython --pylab<CR> i %run 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1 

"ultisnips
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"easymotion 
nmap ss <Plug>(easymotion-s2)

"floating window for fzf
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"semshi
autocmd FileType python call MyCustomHighlights()
function MyCustomHighlights()
	hi  semshiLocal           ctermfg=209 guifg=#ff875f
	hi  semshiGlobal          ctermfg=214 guifg=#ffaf00
	hi  semshiImported        ctermfg=109 guifg=#ffaf00 
	hi  semshiParameter       ctermfg=75  guifg=#5fafff
	hi  semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
	hi  semshiFree            ctermfg=218 guifg=#ffafd7
	hi  semshiBuiltin         ctermfg=175 guifg=#ff5fff
	hi  semshiAttribute       ctermfg=72 guifg=#00ffaf
	hi  semshiSelf            ctermfg=249 guifg=#b2b2b2
	hi  semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
	hi  semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
	hi  semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	hi  semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
endfunction

"rainbow_parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"vim-rainbow
"let g:rainbow_active = 1
au FileType python,vim,markdown,html,java,go,sh,json,css call rainbow#load()

"tagbar
nmap tt :TagbarToggle<CR>
"devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

"goyo
map <LEADER>gy :Goyo<CR>
let g:goyo_width=120
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>

"add addtional string to specific files
autocmd BufNewFile *sh,*py exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'python'
		call setline(1,"#!/usr/bin/env python") 
    	call append(line("."), "# -*- coding: utf-8 -*-") 
    	call append(line(".")+1, "") 
		call append(line(".")+2, "")
	elseif &filetype == 'sh'
		call setline(1,"#!/usr/bin/env python") 
    endif
endfunc 
autocmd BufNewFile * normal G

