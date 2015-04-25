"before checkout git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"vim must 7.4
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
"
"my Plugin here:
" original repos on github
"Plugin 'dgryski/vim-godef'
"Plugin 'Blackrush/vim-gocode'
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
Plugin 'vim-jp/vim-go-extra'
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
let g:EasyGrepMode = 3     " All:0, Open Buffers:1, TrackExt:2,                                                                                                                                                   
let g:EasyGrepDefaultUserPattern = "*.lua *.conf *.proto *.jd.com *.jd.local"   " All:0, Open Buffers:1, TrackExt:2,
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
"======neocomlete===============================================================================
set completeopt-=preview
let g:neocomplete#enable_at_startup       = 1
let g:neocomplete#disable_auto_complete   = 0
let g:neocomplete#enable_ignore_case      = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#data_directory          = '~/tmp/.neocomplete'
" let g:neosnippet#enable_preview = 0

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-c>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"=====================================================================================
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"
"hi link EasyMotionTarget2First MatchParen
"hi link EasyMotionTarget2Second MatchParen
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/javascript.dic
autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/node.dic
autocmd filetype css setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/css.dic
autocmd filetype php setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/php.dic
autocmd BufWritePre *.go :Fmt
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
"#######中括号 大括号 小括号 自动补全
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gvv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
