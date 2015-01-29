"===============================================================================
"=== general Vim settings
"===============================================================================
"colorscheme darkblue
"colorscheme torte      "good for demo

set nocompatible        "do not allow vim compatible with vi mode
set hidden              "allow you switch files without saving them
set showcmd             "sc: Show (partial) command in the last line of the screen. Set this option off
set history=10000
set showmode            "smd: If in Insert, Replace, or Visual mode put a message on the last line
set number
set cmdheight=1         "ch: Number of screen lines to use for the command-line
set viminfo='10000,\"10000
set autochdir
let &titleold='Terminal'
set title
set showmatch           "sm: When a bracket is inserted, briefly jump to the matching one
set ruler               "ru: Show the line and column number of the cursor position, separated by a comma

set incsearch
set hlsearch

syntax on
filetype on

"== To change all the existing tab characters to match the current tab settings, use :retab ==
set cindent             "cin: enables automatic C program indenting
set autoindent
set smartindent         "override tab settings for make files (i.e. use real tabs and not spaces) 

set expandtab	        "et: cooperate with "sw" (use space for tab)
set shiftwidth=4        "sw: number of spaces for indentation
set softtabstop=4       "sts: soft tabstop (interpret tab key as an indent)
set backspace=eol,start,indent "bs: Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
                               "    mode.  This is a list of items, separated by commas.  Each item allows
                               "    a way to backspace over something:
                               "    value   effect
                               "    -----   ------
                               "    indent  allow backspacing over autoindent
                               "    eol     allow backspacing over line breaks (join lines)
                               "    start   allow backspacing over the start of insert; CTRL-W and CTRL-U
                               "            stop once at the start of insert.
"set tabstop=4

"== Override tab settings for make files (i.e., use real tabs and not spaces) ==
autocmd FileType make setlocal noexpandtab tabstop=4
"autocmd filetype make set ts=8 sw=8 sts=8 noet

"== Show the tab and trailing space characters ==
"set list               "List mode: show tabs as CTRL-I is displayed, display $ after end of line.
                        "Useful to see the difference between tabs and spaces and for trailing blanks.
"set listchars=tab:»·,trail:·
"set listchars=tab:>-,trail:-


"== 下面出現一列 bar ==
set laststatus=2        "ls: The value of this option influences when the last window will have a status
                        "    line:
                        "    0: never
                        "    1: only if there are at least two windows
                        "    2: always
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white


"== Encoding setting ==
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1 
"set encoding=utf-8

"== XML folding ==
"au FileType xml setlocal foldmethod=syntax
"zn: disable the folding
"zN: enable the folding
"za: open one closed fold under cursor / close one open folds under cursor
"zA: open all folds under cursor recursively / close all folds under cursor recursively
"zo: open one fold under cursor
"zO: open all folds under cursor recursively
"zc: close one fold under cursor
"zC: open all folds under cursor recursively
"
"[z: Move to the start of the current open fold.
"]z: Move to the end of the current open fold.
"zj: Move downwards to the start of the next fold.
"zk: Move upwards to the end of the next fold.

"== Use the following command to enable folding at runtime ==
"set foldmethod=syntax
set foldmethod=indent
let g:xml_syntax_folding=1
set nofoldenable " | nofoldenable

"== Turn on omni completion ==
"To use omni completion, type <C-X><C-O> while open in Insert mode. 
"If matching names are found, a pop-up menu opens which can be navigated 
"using the <C-N> and <C-P> keys.
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"===============================================================================
"=== key mappings for file editing
"===============================================================================

"== Easy edit of files in the same directory ==
"to enter the ^M (enter): ctrl+v + Enter
"to enter the ^[ (esc):   ctrl+v + ESC
"to enter the ^R:         ctrl+v + ctrl+r
noremap ,e :e <C-R>=expand("%:p:h") . "/"<C-M>
noremap ,f :silent 1,$!xmllint --format --recover - 2>/dev/null<C-M>
noremap ,t :tabnew <C-R>=expand("%:p:h") . "/"<C-M>

"== Press Ctrl+\ to comment out a line ==
vnoremap ^\ _i//
xnoremap <Tab> >gv   "key map for indent in the visual mode
xnoremap <S-Tab> <gv   "key map for indent in the visual mode

"===============================================================================
"=== key mappings for buffers and windows
"===============================================================================
"== To switch to the next buffer, :bnext!, bprevious!   ==
"== To delete a buffer, :bdelete!                       ==
"== To find the current buffers, use ':ls'              ==
noremap <F4> :bprevious!

"== Switch between windows, maximizing the current window ==
set winminheight=1
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_

"== To resize the window to height 12, ':res 12' ==

"===============================================================================
"=== NeoBundle
"===============================================================================

"== Brief help ==
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles 
" :NeoBundleUpdate        - Update bundles

if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'wombat256.vim'
NeoBundle 'https://github.com/JimiSmith/vim-taglist.git'
NeoBundle 'https://github.com/brookhong/cscope.vim.git'
NeoBundle 'STL-Syntax'
NeoBundle 'vim-json-bundle'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'https://github.com/c9s/perlomni.vim.git'
NeoBundle 'https://github.com/ervandew/screen.git'
NeoBundle 'fatih/vim-go'
NeoBundle 'https://github.com/ekalinin/Dockerfile.vim.git'
NeoBundle 'bb:ns9tks/vim-fuzzyfinder', {'depends' : 'bb:ns9tks/vim-l9'}
NeoBundle 'https://github.com/vim-scripts/lookupfile.git'
NeoBundle 'fholgado/minibufexpl.vim'

"== Visual Mark ==
" mm to add bookmark
" F2 & Shift+F2 to navigate bookmarks
NeoBundle 'zhisheng/visualmark.vim'

"== Linting ==
NeoBundle 'scrooloose/syntastic'

"== Auto-completion for quotes, parens, brackets, etc ==
NeoBundle 'Raimondi/delimitMate'

"== For Python ==
NeoBundle 'davidhalter/jedi-vim'

"== For Javascript ==
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nathanaelkane/vim-indent-guides'
" need to install tern first (npm install -g tern)
NeoBundle 'marijnh/tern_for_vim'

call neobundle#end()
filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

"===============================================================================
"=== plugin: syntastic
"===============================================================================
"The plugin can invoke external linter to check your code. To see which external
"linters are supported, look at https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
"Note that aliases do not work; the acutal executables must be available in your $PATH.
"
"This does what it says on the tin. It will check your file on open too, not just on save.
"You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1

"===============================================================================
"=== plugin: delimitMate
"===============================================================================
"to split the current line
imap <C-c> <CR><Esc>O

"===============================================================================
"=== plugin: bufferexplorer
"===============================================================================
" to invoke bufferexplorer:
"   \be (normal open) or :bufexplorer
"   \bs (force horizontal split open)
"   \bv (force vertical split open)
" t: to open buffer in new tab
" D: to delete buffer
let g:bufExplorerDetailedHelp=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

"===============================================================================
"=== plugin: NERDTree
"===============================================================================
"== To invoke NERDTree, :NERDTree or \ndt ==
"noremap \nt :NERDTree<CR>
map <F6> :NERDTreeToggle<RETURN>
let NERDTreeIgnore=['\.o$', '\.dep$', '\.gen$', '\.hpp$', '\.h$']
"
" t: to open file/directory in new tab
" T: same as 't' but keep the focus unchanged
" o: to open file/directory
" O: recursively open
" i: to open file/directory in split window
"
" x: close the currrent node's parent
" X: colose the current node's children
" p: Jump to the current node's parent
" P: Jump to the root node
" u: move the tree root up one directory
"
" r: to recursively refresh the current node
" q: to quick the NERDTree
" ?: for quick help
"
" B: toggle whether the bookmark table is displayed
" :Bookmark <name>, bookmark the current node

"===============================================================================
"=== plugin: FuzzyFinder
"===============================================================================
"== You can launch FuzzyFinder with the following commands:
"            Command            Mode
"            |:FufBuffer|       - Buffer mode (|fuf-buffer-mode|) 
"            |:FufFile|         - File mode (|fuf-file-mode|) 
"            |:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|) 
"            |:FufDir|          - Directory mode (|fuf-dir-mode|) 
"            |:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|) //MRU: Mount Recently Used 
"            |:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|) 
"            |:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|) 
"            |:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|) 
"            |:FufTag|          - Tag mode (|fuf-tag-mode|) 
"            |:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|) 
"            |:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|) 
"            |:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|) 
"            |:FufChangeList|   - Change-List mode (|fuf-changelist-mode|) 
"            |:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|) 
"            |:FufLine|         - Line mode (|fuf-line-mode|) 
"            |:FufHelp|         - Help mode (|fuf-help-mode|) 
noremap fb :FufBuffer<CR>
noremap ff :FufFile<CR>
noremap fc :FufMruCmd<CR>

"let g:FuzzyFinderOptions.Base.enumerating_limit = 10
" Enter: to open file in the current window
" <C-l>: to open file in a new tab
" <C-t>: to change mode
" To fresh the cache, :FuzzyFinderRenewCache
" to recursively search the child directories, enter search patterns like "**\*.txt"

"===============================================================================
"=== plugin: EasyGrep
"===============================================================================
" :help EasyGrep
" to search patterns, \vv
" to search and replace patterns, \vr
" to change the search option, \vo
let g:EasyGrepReplaceWindowMode=0  "replace in a new tab
let g:EasyGrepEveryMatch=1         "global match
let g:EasyGrepReplaceAllPerFile=1  "'y' for the whole file, not for the the whole search result

"===============================================================================
"=== plugin: gdb settings
"===============================================================================
syntax enable                      "enable syntax highlighting
set previewheight=12
run macros/gdb_mappings.vim        "source key mappings listed in this document
"set asm=0                          "don't show any assembly stuff
"set gdbprg=/usr/bin/gdb

"===============================================================================
"=== plug-in: Taglist  (depend on ctags)
"===============================================================================
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_File_Fold_Auto_Close=1
"let Tlist_GainFocus_On_ToggleOpen = 1
filetype on

"== Hotkey definition for taglist ==
noremap <F12> :Tlist<CR>
noremap <F3> :wincmd p

"===============================================================================
"=== cscope
"===============================================================================
" find $WORKDIR/datapower -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" > $WORKDIR/datapower/cscope.files
" cscope -Rbq
" export CSCOPE_DB=$WORKDIR/datapower/cscope.out

"== ctrl + shift + _, then press "s", to find the symbol under cursor (shortcut for cscope) ==
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"== ctrl + shift + _, then press "f", to open the file under cursor (shortcut for cscope) ==
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

"== shortcut for cscope (<C-@> is ctrl + @) ==
"s: find this c symbol
"g: find this definition
"d: find functions called by this function
"c: find functions calling this function
"t: find this text string
"e: find this egrep pattern
"f: find this file
"i: find files #include this file
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>      
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

"===============================================================================
"=== plug-in: OmniCppComplete  (depend on ctags)
"===============================================================================
"== http://vim.wikia.com/wiki/C++_code_completion ==
"== http://design.liberta.co.za/articles/code-completion-intellisense-for-cpp-in-vim-with-omnicppcomplete/ ==
"
":help omnicppcomplete
"
"cd $WORKDIR/datapower/
"find $WORKDIR/datapower/ -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" > $WORKDIR/datapower/ctags.files
"ctags -n -f omnicppcomplete.tags --C++-types=+p --c++-kinds=+p --fields=+iaS --extra=+q * -L ctags.files
"
"== enable the plugin (required) ==
"set nocp
"filetype plugin on
"set tags+=/userdata/p4/main/datapower/onmicppcomplete.tags

"== auto close options when exiting insert mode (conflicts with gdbvim) ==
"== autocmd InsertLeave * if pumvisible() == 0|pclose|endif ==
"set completeopt=menu,menuone

"== to invoke OmniCppComplete, <C-x><C-o> ==
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_DisplayMode=1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 2
"let OmniCpp_ShowPrototypeInAbbr = 1

"===============================================================================
"=== plug-in: minibuffer
"===============================================================================
" control + the vim direction keys [hjkl] can be made to move you between windows. 
" control + arrow keys can be made to do the same thing 
"  control + tab & shift + control + tab can be setup to switch through your open windows (like in MS Windows) 
" control + tab & shift + control + tab can alternatively be setup to cycle forwards and backwards through your modifiable buffers in the current window 
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 


"===============================================================================
"=== plug-in: Lookupfile (similar to fuzzyfinder)
"===============================================================================
if filereadable(expand('$WORKDIR/filenametags'))
   let g:LookupFile_TagExpr = string(expand('$WORKDIR/filenametags'))
endif

"if !exists('g:LookupFile_TagExpr')
"  let g:LookupFile_TagExpr = '"$WORKDIR/datapower/filenametags"'
"endif


"===============================================================================
"=== plug-in: trinity
"===============================================================================
"trinity.vim: Build the trinity of srcexpl,taglist, NERD_tree to be a good IDE
"nmap <F8> :TrinityToggleAll<CR>
"nmap <F9> :TrinityToggleSourceExplorer<CR>
"nmap <F10> :TrinityToggleTagList<CR>
"nmap <F11> :TrinityToggleNERDTree<CR>


"===============================================================================
"=== plug-in: 
"===============================================================================
"echofunc.vim: Echo the function declaration in the command line for C/C++
"AutoClose.vim
"Surround.vim


"===============================================================================
"=== vim tips
"===============================================================================
"Execute {cmd} in each buffer in the buffer list
":bufdo! [cmd]


"===============================================================================
"=== Misc kep mapping
"==============================================================================
map <F9> :set paste!<BAr>set paste?<CR>
set pastetoggle=<F9>
map <F8> :set number!<BAr>set number?<CR>
"map <F7> :set spell!<BAr>set spell?<CR>


"===============================================================================
"=== This is just the colorscheme " desert " . I put it here for lazy
"==============================================================================
" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2003/05/06 16:37:49 $
" Last Change:	$Date: 2003/06/02 19:40:21 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.6 2003/06/02 19:40:21 fugalh Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
	syntax reset
	endif
endif
let g:colors_name="desert"

hi Normal	guifg=White guibg=grey20
hi Cursor	guibg=khaki guifg=slategrey
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=grey30
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
hi Visual	gui=none guifg=khaki guibg=olivedrab
hi Comment	term=bold ctermfg=cyan

if v:version > 700
   set cursorline
endif



