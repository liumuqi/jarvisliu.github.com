"before checkout git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"augroup project
    "autocmd!
    "autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END
"vim must 7.4
"filetype off
language messages zh_CN.utf-8
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
"
"my Plugin here:
" original repos on github
"Plugin 'vim-flake8'
"Plugin 'tmux-plugins/vim-tmux'
"Plugin 'vim-ruby/vim-ruby'
"自动补全end
Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-rails'
"Plugin 'thoughtbot/vim-rspec'

Plugin 'Konfekt/FastFold'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
"Bundle 'rizzatti/funcoo.vim'
"Plugin 'nsf/gocode', { 'rtp': 'vim', 'do': '~/golibs/src/github.com/nsf/gocode/vim/symlink.sh'  }
"Plugin 'nsf/gocode', {'rtp': 'vim/'}
"Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kshenoy/vim-signature'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-quickhl'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-jp/vim-go-extra'
Plugin 'mileszs/ack.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'idanarye/vim-merginal'
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'asins/vimcdoc'
Plugin 'a.vim'
"Plugin 'asins/vim-dict'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimshell.vim'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip' " 通过%跳转配对代码
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'asins/vim-colors'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular' "必须先在vim-markdown前面
"Plugin 'plasticboy/vim-markdown'
Plugin 'gregsexton/gitv'
"..................................
" vim-scripts repos
Plugin 'vcscommand.vim'
"Plugin 'SudoEdit.vim'
Plugin 'EasyGrep'
"Plugin 'VimIM'
"......................................
" My Plugins here:
"
" vim-scripts repos
" Syntax
"Plugin 'asciidoc.vim'
"Plugin 'confluencewiki.vim'
Plugin 'JavaScript-syntax'
"Plugin 'mako.vim'
"Plugin 'moin.vim'
" Color
Plugin 'desert256.vim'
Plugin 'fatih/molokai'
Plugin 'Impact'
Plugin 'matrix.vim'
Plugin 'vibrantink'
Plugin 'vividchalk.vim'
" Ftplugin
" Indent
Plugin 'othree/html5.vim'
Plugin 'IndentAnything'
Plugin 'Javascript-Indentation'
Plugin 'mako.vim--Torborg'
" Plugin
Plugin 'AutoClose--Alves'
Plugin 'auto_mkdir'
"Plugin 'cecutil'
"Plugin 'fcitx.vim'
Plugin 'FencView.vim'
"Plugin 'FuzzyFinder'
Plugin 'jsbeautify'
Plugin 'L9'
Plugin 'Mark'
Plugin 'mru.vim'
Plugin 'restart.vim'
Plugin 'templates.vim'
"Plugin 'vimim.vim'
Plugin 'ZenCoding.vim'
Plugin 'css_color.vim'
"Plugin 'LustyExplorer'
Plugin 'hallettj/jslint.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
call vundle#end()
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on
filetype plugin on

"proto语法文件
 augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
 augroup end

"恢复上次光标位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"启动界面
set shortmess=atI
"                                   mac os map
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
map <Esc>OP <F1>
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
syntax on
syntax enable
" set mapleader
let mapleader=","

let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'full'
"set mouse=v " 设置粘贴和复制
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"=====================================================
let g:EasyGrepMode = 0     " All:0, Open Buffers:1, TrackExt:2,
"let g:EasyGrepDefaultUserPattern = "*.go *.lua *.conf *.proto"
let g:EasyGrepCommand = 1  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 0 " not ignorecase:0
let g:EasyGrepFilesToExclude = "tags,*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak, *.log"
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
"====================================================
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"=====================================================================================
let g:ctrlp_map = '<c-l>'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_custom_ignore = "{
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|log)$',
  \ 'link': 'some_bad_symbolic_links',
  \}"
"======neocomlete===============================================================================
let g:neocomplete#enable_at_startup       = 1
let g:neocomplete#disable_auto_complete   = 0
let g:neocomplete#enable_ignore_case      = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#data_directory          = '~/tmp/.neocomplete'
let g:neosnippet#enable_preview = 0


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
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
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

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
let g:neocomplete#enable_auto_select = 1

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
let g:neocomplete#force_overwrite_completefunc = 1
"" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"=====================================================================================
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"
"hi link EasyMotionTarget2First MatchParen
"hi link EasyMotionTarget2Second MatchParen
"autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/javascript.dic
"autocmd filetype javascript setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/node.dic
"autocmd filetype css setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/css.dic
"autocmd filetype php setlocal dictionary+=$VIMFILES/bundle/vim-dict/dict/php.dic
"autocmd FileType go compiler go 

autocmd BufWritePre *.go :Fmt
" =================================进行Taglist的设置<Begin>============================
nmap <F3> :TagbarToggle<CR>
"                             ctags
"
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_async =1
let g:easytags_always_enabled = 1
let g:easytags_auto_highlight = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_on_cursorhold = 1
let g:easytags_include_members = 1
highlight link cMember Special
highlight cMember gui=italic
let g:easytags_resolve_links = 1
"因为我们放在环境变量里，所以可以直接执行 
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边  
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表 
let Tlist_File_Fold_Auto_Close=1        "非当前文件，函数列表折叠隐藏 
"let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim 
let Tlist_Process_File_Always=1         "是否一直处理tags.1:处理;0:不处理  
let Tlist_Inc_Winwidth=1 "不是一直实时更新tags，因为没有必要  



" Cucumber navigation commands
autocmd Syntax javascript set syntax=jquery


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
nnoremap <silent> <Leader>p :CtrlPMixed<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" ############################键盘映射设置区域###############################
map <F2> :NERDTreeToggle<CR>
nnoremap <F9> :GundoToggle<CR>
" ###########################MAC 系统 剪切板  ##############################
vmap <C-i> :w !pbcopy<cr><cr>
nmap <C-g> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <C-o> :!pbcopy<cr>
"####################################################
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
let g:EasyMotion_startofline = 1
" 对应使用函数的配置
"set guitablabel=%{ShortTabLabel()}
"function ShortTabLabel ()
"	let bufnrlist = tabpagebuflist (v:lnum)
"	let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
"	let filename = fnamemodify (label, ':t')
"	return filename
"endfunction
"#######中括号 大括号 小括号 自动补全
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gvv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>go <Plug>(go-info)
au FileType go nmap <Leader>ge <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
let g:go_term_mode = "split"
let g:go_term_enabled = 1
au Filetype go nnoremap <leader>vp :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>sp :sp <CR>:exe "GoDef"<CR>
"au Filetype go nnoremap <leader>sp :sp <CR>:exe "GoDef"<CR>
"nmap <Space>m <Plug>(quickhl-manual-this)
"xmap <Space>m <Plug>(quickhl-manual-this)
"nmap <Space>M <Plug>(quickhl-manual-reset)
"xmap <Space>M <Plug>(quickhl-manual-reset)
"
"nmap <Space>j <Plug>(quickhl-cword-toggle)
"nmap <Space>] <Plug>(quickhl-tag-toggle)
"map H <Plug>(operator-quickhl-manual-this-motion)
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path = expand("~/golibs/bin")
let g:go_autodetect_gopath = 1
"let g:go_oracle_scope= expand('./')
"let g:go_guru_scope = ["./","/usr/local/go/src/","golang.org/x/tools/..."]
let g:go_guru_scope = ["./","/Users/qishan/golibs/src/","/usr/local/go/src/"]
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,abs:/Developer/usr/clang-ide/lib/c++/v1,abs:/usr/local/include,abs:/usr/include/'
"let g:go_oracle_scope = expand(gomypath)
let g:go_auto_type_info = 1
let g:go_snippet_engine = 'neosnippet'
let g:go_highlight_build_constraints = 1
let g:go_quickfix_height = 10


"========Syntastic====================
"                                 错误检查
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"whether to show balloons
let g:syntastic_enable_balloons = 1

"安装flake8: easy_install flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_loc_list_height = 10

let g:golang_goroot ="/usr/local/go"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck','GoErrCheck']
let g:go_list_type = "quickfix"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol='>'
let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
"let g:syntastic_html_checkers=['tidy', 'jshint']
highlight SyntasticErrorSign guifg=red guibg=black
"================================================================


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pyclewn
 let g:pyclewn_args="--terminal=TERMINAL --window=bottom"
 autocmd BufRead *.c* map <F5>  :TagbarClose<CR> :Pyclewn<CR> :call StartDebug()<CR> :call StartDebugC()<CR> 
 autocmd BufRead *.py map <F5>  :TagbarClose<CR> :Pyclewn pdb %:p<CR> :call StartDebug()<CR> :call StartDebugPy()<CR>
 autocmd BufRead *.py nmap <F6> :!python %<CR> 
 autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
 autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
 map <F4>  :nbclose<CR> <C-j>wc :call StopDebug()<CR>
 func! StartDebug()
 map <S-b> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
 map <S-e> :exe "Cclear " . expand("%:p") . ":" . line(".")<CR>
 map <S-u> :exe "Cup "<CR>
 map <S-d> :exe "Cdown "<CR>
 map <S-n> :exe "Cnext "<CR>
 map <S-c> :exe "Ccontinue "<CR>
 map <S-s> :exe "Cstep "<CR>
 map <S-f> :exe "Cfinish "<CR>
 map <S-w> :exe "Cwhere "<CR>
 map <S-l> :exe "Cinfo locals "<CR>
 map <S-t> :exe "Cinfo break "<CR>
 map <S-x> :exe "Cfoldvar " . line(".")<CR>
 endfunc

 func! StartDebugC()
    map <S-z> :exe "Csigint "<CR>
    map <S-a> :exe "Cinfo args "<CR>
    map <S-r> :exe "Crun "<CR>
    map <S-p> :exe "Cprint " . expand("<cword>") <CR>
    map <S-q> :exe "Cquit "<CR>
 endfunc
 func! StartDebugPy()
    map <S-z> :exe "Cinterrupt "<CR>
    map <S-a> :exe "Cargs "<CR>
    map <S-r> :exe "Creturn "<CR>
    map <S-p> :exe "Cp " . expand("<cword>") <CR>
    map <S-q> :exe "Cquit "<CR> <C-j>wc
 endfunc

 func! StopDebug()
 unmap <S-b>
 unmap <S-e>
 unmap <S-u>
 unmap <S-d>
 unmap <S-n>
 unmap <S-c>
 unmap <S-s>
 unmap <S-f>
 unmap <S-w>
 unmap <S-l>
 unmap <S-t>
 unmap <S-x>
 unmap <S-z>
 unmap <S-a>
 unmap <S-r>
 unmap <S-p>
 unmap <S-q>
 endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"								DoxygenToolkit
"
let g:DoxygenToolkit_authorName="qishan"
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
map <C-a> :DoxAuthor<CR>
map <C-s> :Dox<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






"===========git vimdiff===================================
" 修改高亮的背景色, 适应主题
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red   guibg=#8CCBEA
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red   guibg=#A4E57E
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red   guibg=#FFDB72
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red   guibg=#FF7272

"hi DiffAdd  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
"hi DiffDelete  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
"hi DiffChange  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
"hi DiffText  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
"hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
"hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black

" to see error location list
function! CloseScratch() abort
    pc
endfunction
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <Leader>c :call CloseScratch()<cr>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
endfunction

nnoremap <silent> <Leader>dl :diffget local<CR>
nnoremap <silent> <Leader>db :diffget base<CR>
nnoremap <silent> <Leader>dr :diffget remote<CR>
nnoremap <silent> <Leader>df :call DiffToggle()<CR>
"=======================nerdtree=====================
" Globals
" NERDTree width
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden=0
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
"忽略文件、隐藏文件
 let NERDTreeIgnore = ['\.pyc$']
 let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
"===================================================
set noignorecase
set smartcase
set mouse=a
set ttymouse=xterm2
command W w !sudo tee % > /dev/null
set grepprg=ack
set ffs=unix,dos,mac
set modelines=0		" CVE-2007-2438
set hls
set incsearch
set ic
set tw=85
set textwidth=80
set wrap linebreak nolist
set backspace=2 " more powerful backspacing
set list lcs=tab:\|\ 
"1. manual //手工定义折叠
"2. indent //用缩进表示折叠
"3. expr　 //用表达式来定义折叠
"4. syntax //用语法高亮来定义折叠
"5. diff   //对没有更改的文本进行折叠
"6. marker //用标志折叠
"set foldmethod=syntax
set writebackup
set autoread
set autowrite
set ru
set sm  "smartmatch"
set cursorline "设置光标行线
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set nocp    "设置兼容
set expandtab   "设置tab
set smarttab
set shiftwidth=4    "设置tab的间隔
set tabstop=4   "四个空格代表一个tab
set sts=4
set showmatch   "在输入括号时光标会短暂地跳到与之相匹配的括号处
set autoindent  "设置自动缩进
set smartindent "设置智能缩进
set lbr
set number  "设置是否显示行
"set guifont=Monospace\ 11  "设置字体大小 
set guifont=Liberation_Mono_for_Powerline:h13
set encoding=utf-8  "设置编码为utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,GB18030,cp936,big5,euc-jp,euc-kr,latin1
set fencs=utf-8,GB18030,gbk
set helplang=cn "帮助中文支持
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

colorscheme molokai
" Display extra whitespace
set list listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set laststatus=2   " Always show the statusline

iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
set nocompatible "Use Vim defaults instead of 100% vi compatibility
set iskeyword+=_,$,@,%,#,-
set history=500
set linebreak
set updatecount=300
set updatetime=50000
set guioptions+=T
set guioptions+=m
hi Comment ctermfg=6
"gf 命令 go file 到该文件去
"set path+=expand("~/golibs")
set completeopt=menuone,menu,longest,preview
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif "MacOSX/Linux"
set noswapfile
set fillchars+=stl:\ ,stlnc:\
"=========set c env===========
set exrc
set secure
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
let &path.="./,./src/,./include,./src/include,/usr/include/AL,"
set includeexpr=substitute(v:fname,'\\.','/','g')
