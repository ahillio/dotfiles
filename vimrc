" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
" do not keep a backup file, use versions instead
  set nobackup
else
" keep a backup file
set backup
endif

set history=500
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd		
" do incremental searching
set incsearch		

" Don't use Ex mode, use Q for formatting
map Q gq

" Set Leader
let mapleader = " "
" Fix indentation of entire file
map <Leader>i mmgg=G`m<CR>
" FancyPants Paste
"map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>s :<C-U>echo 'Hello World'<CR>
"map <Leader>t :NERDTree<CR>

" copy file path to clipboard
map <Leader>fp :let @+ = expand("%")<cr>
map <Leader>yf :let @+ = expand("%")<cr>
"map <Leader>fp :let @" = expand("%")<cr>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
    " @TODO new vimwiki diary pages have cursor at the end which is annoying
		autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
  augroup END

	augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
    autocmd BufNewFile ecotech_*.mkd 0r ~/.vim/templates/template_ecotech.mkd
    autocmd BufNewFile ~/Documents/wiki/diary/*.mkd :silent 0r !vimwiki-diary-template.py
  augroup END  
  " VimWiki Diary
  command! Diary VimwikiDiaryIndex
  augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.mkd VimwikiDiaryGenerateLinks
  augroup end
  " End Vimiki Diary

  function GotoTaskLine()
    normal 23G22|
    normal zt
  endfunction
  "autocmd BufRead,BufNewFile *.task call GotoTaskLine()
  "autocmd BufRead,BufNewFile task.*.task normal zt
	augroup SkipTaskComments
    autocmd BufEnter,BufRead task.*.task
      \ normal 23G22|zt
	" https://vi.stackexchange.com/questions/24736/how-to-redraw-screen-with-cursor-at-top-like-zt-from-autocommand?noredirect=1#comment43520_24736
"	autocmd BufEnter,BufRead task*.*task
"			\ normal 23gg22|zt
"       "works the same as \ normal 23G22|zt
	augroup end

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Alec's additions:
" colorscheme molokai
" colorscheme jellybeans

set cursorline

" set nowrap
set wrap linebreak
set breakindent
let &showbreak='  '

set nobackup
set nowritebackup

" plugins wtf:
" we don't need this 
" set nocompatible
" call pathogen#infect('/root/.drush/vimrc/bundle/{}')
" call pathogen#infect('/usr/share/vim/vim74/bundle/{}')

filetype plugin on

let php_htmlInStrings = 1

" Autocmd hack to set colorscheme for different languages.
" autocmd BufEnter *.css color pablo.
" autocmd BufEnter *.css color elflord.

" Move between split panes via Alt + Left arrow, etc.
" we do this differently below, and match the way tmux does it
" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>


" Tabs and Indent.
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent

" Use Pathogen to manage plugins
execute pathogen#infect()

let g:airline_powerline_fonts = 1
set laststatus=2
" previously
" set timeoutlen=50
" I guess because of airline???
" set according to :help timeoutlen
set timeout timeoutlen=3000 ttimeoutlen=100
set noshowmode

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" apparently needs gvim (gui) to work?
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 15

let g:airline_theme='raven' "ubaryd silver serene raven


let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors = 16
" 256 makes blackish background in tmux
let g:solarized_termcolors = 256

" make work with tmux
set term=screen-256color

syntax enable
set background=dark
colorscheme solarized

set clipboard=unnamed

command! FormatJson %!python -m json.tool

set foldmethod=indent
" @todo @wanted: drupal-smart code folding for browsing views displays 
" as in a crm_core_donation.views_default.inc file.
" Currently all the views and everything is at the same level of indentation
" so folmethod=indent is useless.  This might need to be custom because it
" would begin at `$view = new view();` or `/* Display: Block */` and end at `export`.

" For Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


" For navigating in and out of TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Balance vim panes when tmux panes are created
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
" nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
" nnoremap <leader>= :wincmd =<cr>

" Cursor shape | / [] /  _ based on vim mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Disable YouCompleteMe until I learn how to use it :/
" let g:loaded_youcompleteme = 1

" Show the syntax highlight groups are being used for the item under the
" cursor (because in html syntax <em> tags get a distracting dark background:
"map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
" http://andrewradev.com/2011/08/06/making-vim-pretty-with-custom-colors/
" http://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax

" XDEBUG
" vdebug recommends this
call pathogen#helptags()
" Defaults
" <F5>: start/run (to next breakpoint/end of script)
" <F2>: step over
" <F3>: step into
" <F4>: step out
" <F6>: stop debugging (kills script)
" <F7>: detach script from debugger
" <F9>: run to cursor
" <F10>: toggle line breakpoint
" <F11>: show context variables (e.g. after "eval")
" <F12>: evaluate variable under cursor :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints) :VdebugEval <code>: evaluate some code and display the result <Leader>e: evaluate the expression under visual highlight and display the result - See more at: https://www.mediacurrent.com/blog/debug-drupal-php-vim-vdebug#sthash.g892I2qx.dpuf
" Bob Kepfords's
let g:vdebug_keymap = {
\ "run" : "<Leader>/",
\ "run_to_cursor" : "<Down>",
\ "step_over" : "<Up>",
\ "step_into" : "<Left>",
\ "step_out" : "<Right>",
\ "close" : "q",
\ "detach" : "<F7>",
\ "set_breakpoint" : "<Leader>s",
\ "eval_visual" : "<Leader>e"
\} 
" See more at: https://www.mediacurrent.com/blog/debug-drupal-php-vim-vdebug#sthash.g892I2qx.dpuf
" Allows Vdebug to bind to all interfaces.
let g:vdebug_options = {}
" Stops execution at the first line.
let g:vdebug_options['break_on_open'] = 0
" let g:vdebug_options['break_on_open'] = 1
let g:vdebug_options['max_children'] = 128
" Use the compact window layout.
let g:vdebug_options['watch_window_style'] = 'compact'
" Need to set as empty for this to work with Vagrant boxes.
let g:vdebug_options['server'] = ""

" END DEBUG "

" Use system clipboard
" @todo: Using the system keyboard should only be done for yank
" but instead this is global, so deleted characters copy to system clipboard :(
set clipboard=unnamedplus

" autochdir useful for tags=tags
" it should search through parent dirs until it finds a tags file
"but I don't like autchodir :/
"set autochdir
set tags=tags;
"set tags=./tags,tags
"set tags=./tags;,tags;
set relativenumber
set number

set smartcase

" enable printing to postscript or something
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

" Use Ctrl+s to save
" note this requires shell configuration/compatibility,
" sometimes with terminal emulator, in my case in zshrc.
" works for 'insert' mode
inoremap <c-s> <Esc>:w<CR>
" works for 'normal' mode
nnoremap <c-s> :w<CR>

" for javascript coloring:
let g:javascript_plugin_jsdoc = 1

" " automatically make shell scripts executable
" au BufWritePost * if getline(1) =~ "^#! */bin/[a-z]*sh" | silent !chmod a+x <afile>
" au BufWritePost * | endif
" " is `au` short for `autocmd`?
" " why does that take 2 lines?  and why isn't `endif` on the first line?


" functions for strikethrough
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
" /end functions for strikethrough

" fade colors for ~~
au BufRead,BufNewFile *.txt,*.mkd   syntax match StrikeoutMatch /\~\~.*$/   
"au BufRead,BufNewFile *.txt   syntax match StrikeoutMatch /\~\~.*\~\~/   
hi def  StrikeoutColor   ctermbg=234 ctermfg=238    guibg=#242424 guifg=darkgray
" for colors see https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
hi link StrikeoutMatch StrikeoutColor
" /end fade colors for ~~

"disable folds:
autocmd BufRead,BufNewFile *.task,*.mkd,*.txt set nofoldenable

"let wiki_1 = {}
"let wiki_1.path = '~/Work/ahillio_labs/human-ecology/'
"let wiki_1.syntax = 'markdown'
"let wiki_1.ext = '.mkd'
"let wiki_1.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'php': 'php', 'javascript': 'js'}
"
"let wiki_2 = {}
"let wiki_2.path = '~/Work/ahillio_labs/tech-wiki/'
"let wiki_2.syntax = 'markdown'
"let wiki_2.ext = '.mkd'
"let wiki_2.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'php': 'php', 'javascript': 'js'}
"
"let wiki_3 = {}
"let wiki_3.path = '~/Documents/wiki'
"let wiki_3.syntax = 'markdown'
"let wiki_3.ext = '.mkd'
"let wiki_3.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'php': 'php', 'javascript': 'js'}
"
"let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

let g:vimwiki_list = [{'path': '~/Documents/wiki/', 'syntax': 'markdown', 'ext': '.mkd'},
                     \ {'path': '~/Work/ahillio_labs/tech-wiki/', 'syntax': 'markdown', 'ext': '.mkd'},
                     \ {'path': '~/Work/ahillio_labs/human-ecology/', 'syntax': 'markdown', 'ext': '.mkd'}]

:call vimwiki#vars#init()

" is this what breaks syntax?
let g:vimwiki_ext2syntax = {'.mkd': 'markdown', '.md': 'markdown', '.mdown': 'markdown', '.markdown': 'markdown'}

" `wiki` is undefined variable.  Should I simply define variable named 'wiki'
" or should `.nested_sentaxes` be applied to `wiki_list`?
let wiki = {}
let wiki.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'php': 'php', 'javascript': 'js'}
let g:vimwiki_hl_headers = 1




" ledger bookkeeping config:
let g:ledger_maxwidth = 80
let g:ledger_fillstring = '    -'
let g:ledger_detailed_first = 1
let g:ledger_fold_blanks = 0
