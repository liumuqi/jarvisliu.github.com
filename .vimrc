set rtp+=~/.vim/bundle/Vundle.vim
"
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/vundle'
"
"my Plugin here:
" original repos on github
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'sukima/xmledit'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'klen/python-mode'
Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-quickhl'
Plugin 'Lokaltog/vim-powerline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'asins/vimcdoc'
Plugin 'asins/vim-dict'
Plugin 'Shougo/vimshell.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip' " 通过%跳转配对代码
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'
Plugin 'asins/vim-colors'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular' "必须先在vim-markdown前面
Plugin 'plasticboy/vim-markdown'
Plugin 'gregsexton/gitv'
"..................................
" vim-scripts repos
Plugin 'YankRing.vim'
Plugin 'vcscommand.vim'
"Plugin 'SudoEdit.vim'
Plugin 'EasyGrep'
"Plugin 'VimIM'
"......................................
" My Plugins here:
"
" vim-scripts repos
" Syntax
Plugin 'asciidoc.vim'
Plugin 'confluencewiki.vim'
Plugin 'JavaScript-syntax'
Plugin 'mako.vim'
Plugin 'moin.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'xml.vim'
" Color
Plugin 'desert256.vim'
Plugin 'Impact'
Plugin 'matrix.vim'
Plugin 'vibrantink'
Plugin 'vividchalk.vim'
" Ftplugin
Plugin 'python_fold'
" Indent
Plugin 'othree/html5.vim'
Plugin 'IndentAnything'
Plugin 'Javascript-Indentation'
Plugin 'mako.vim--Torborg'
Plugin 'gg/python.vim'
" Plugin
Plugin 'The-NERD-tree'
Plugin 'AutoClose--Alves'
Plugin 'auto_mkdir'
Plugin 'cecutil'
Plugin 'fcitx.vim'
Plugin 'FencView.vim'
"Plugin 'FuzzyFinder'
Plugin 'jsbeautify'
Plugin 'L9'
Plugin 'Mark'
Plugin 'mru.vim'
"Plugin 'The-NERD-Commenter'
Plugin 'restart.vim'
Plugin 'templates.vim'
"Plugin 'vimim.vim'
Plugin 'ZenCoding.vim'
Plugin 'css_color.vim'
"Plugin 'LustyExplorer'
"Plugin 'hallettj/jslint.vim'
call vundle#end()
filetype plugin indent on
set modelines=0		" CVE-2007-2438
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set hls
set incsearch
set ic
set wrap
set backspace=2		" more powerful backspacing
set list lcs=tab:\|\ 
"1. manual //手工定义折叠
"2. indent //用缩进表示折叠
"3. expr　 //用表达式来定义折叠
"4. syntax //用语法高亮来定义折叠
"5. diff   //对没有更改的文本进行折叠
"6. marker //用标志折叠
"set foldmethod=indent
au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
filetype  plugin indent on
syntax on
set nocp    "设置兼容
set expandtab   "设置tab
set shiftwidth=4    "设置tab的间隔
set tabstop=4   "四个空格代表一个tab
set sts=4
set showmatch   "在输入括号时光标会短暂地跳到与之相匹配的括号处
set autoindent  "设置自动缩进
set smartindent "设置智能缩进
set tw=500
set lbr
set number  "设置是否显示行
"set guifont=Monospace\ 11  "设置字体大小 
set encoding=utf-8  "设置编码为utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,GB18030,cp936,big5,euc-jp,euc-kr,latin1
set helplang=cn "帮助中文支持
colorscheme  vividchalk
" Display extra whitespace
set list listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set mouse=v " 设置粘贴和复制
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:EasyGrepMode = 1     " All:0, Open Buffers:1, TrackExt:2, 
"let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak,*.log"
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
"=====================================================================================
let g:ctrlp_map = '<c-l>'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = "{
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|log)$',
  \ 'link': 'some_bad_symbolic_links',
  \}"
"=====================================================================================
let g:neocomplete#enable_at_startup       = 1
let g:neocomplete#disable_auto_complete   = 1
let g:neocomplete#enable_ignore_case      = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#data_directory          = '~/tmp/.neocomplete'
" let g:neosnippet#enable_preview = 0
" set completeopt+=preview
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"
"hi link EasyMotionTarget2First MatchParen
"hi link EasyMotionTarget2Second MatchParen
"自动补全配置
"autocmd FileType python set omnifunc=pythoncomplete#Complete 
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags 
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
"autocmd FileType c set omnifunc=ccomplete#Complete 
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/javascript.dic
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/node.dic
autocmd filetype css setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/css.dic
autocmd filetype php setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/php.dic
" =================================进行Taglist的设置<Begin>============================
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
"因为我们放在环境变量里，所以可以直接执行 
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边  
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表 
let Tlist_File_Fold_Auto_Close=1        "非当前文件，函数列表折叠隐藏 
"let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim 
"let Tlist_Process_File_Always=0         "是否一直处理tags.1:处理;0:不处理  
"let Tlist_Inc_Winwidth=0 "不是一直实时更新tags，因为没有必要  
" =================================进行Taglist的设置<End>==============================
hi MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
hi MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
nmap <silent> <Leader>hl <plug>MarkSet
vmap <silent> <Leader>hl <plug>MarkSet
nmap <silent> <Leader>hh <plug>MarkClear
nmap <silent> <Leader>hr <plug>MarkRegex
vmap <silent> <Leader>hr <plug>MarkRegex
nnoremap <silent> <Leader>f :CtrlPMRU<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" ############################键盘映射设置区域###############################
map <F2> :NERDTreeToggle<CR>
map <F4> t :NERDTreeMirror<CR>
nnoremap <F8> :GundoToggle<CR>
" ###########################MAC 系统 剪切板  ##############################
vmap <C-c> :w !pbcopy<cr><cr>
nmap <C-F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <C-x> :!pbcopy<cr>
"####################################################
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
let g:EasyMotion_startofline = 0 
" 对应使用函数的配置
"set guitablabel=%{ShortTabLabel()}
"function ShortTabLabel ()
"	let bufnrlist = tabpagebuflist (v:lnum)
"	let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
"	let filename = fnamemodify (label, ':t')
"	return filename
"endfunction
" vim 标签样式
" TabLineFill tab pages line, where there are no labels
hi TabLineFill term=none
hi TabLineFill ctermfg=DarkGrey
hi TabLineFill guifg=#777777
" TabLineSel tab pages line, active tab page label
hi TabLineSel term=inverse
hi TabLineSel cterm=none ctermfg=yellow ctermbg=Black
hi TabLineSel gui=none guifg=yellow guibg=Black
" Develop editing options
au FileType vim setl expandtab
au FileType vim setl shiftwidth=2
au FileType vim setl tabstop=2
" 显示状态栏(默认值为 1，无法显示状态栏)
set laststatus=2
" Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}E5%h\ \ \ Line:\ %l/%L:%c 
function!  CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction
"#######################设置PHP函数自动提醒#########################Ｓｔａｒｔ
"设置字典自动完成
"set complete+=k
""设置字典
"set dictionary=~/.vim/doc/php_funclist.txt
"" 自动完成使用ＴＡＢ键
"function!  InsertTabWrapper()
"	let col=col('.')-1
"	if !col || getline('.')[col-1] !~ '\k'
"		return "\<TAB>"
"	else
"		return "\<C-N>"
"	endif
"endfunction
""将InsertTabWrapper映射到ＴＡＢ上
"inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
"#######################设置PHP函数自动提醒#########################Ｅｎｄ
"#######中括号 大括号 小括号 自动补全
":inoremap ( ()<ESC>i
":inoremap) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
"function ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction
"#######中括号 大括号 小括号 自动补全
