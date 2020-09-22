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

map <Leader>bgl :set background=light <Enter>
map <Leader>bgd :set background=dark <Enter>

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


set cursorline

" set nowrap
set wrap linebreak
set breakindent
let &showbreak='  '

set nobackup
set nowritebackup

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


let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors = 16
" 256 makes blackish background in tmux
let g:solarized_termcolors = 256

" make work with tmux
set term=screen-256color

syntax enable
"@TODO use shell variable to set background light/dark
"shell alias `bgl` & `bgd` should also set shell variables && bonus: `tmux
"send-keys` to all vim instances to run `:set bg=` !!!
set background=light
"set background=dark
colorscheme solarized

set clipboard=unnamed

command! FormatJson %!python -m json.tool


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

" cursor shape | / [] /  _ based on vim mode
" this works in some other terminal
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" for konsole in kde5
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" YouCompleteMe
let g:loaded_youcompleteme = 1
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}

" Ultisnips
" Trigger configuration. You need to change this to something else than <tab>
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="~"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


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

set ignorecase
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

" delete current file (useful for outdated tasknote files and other less common scenarios)
nnoremap <leader>dd. :call delete(expand('%')) \| bdelete! <Enter>


" Don't set 'modified' when reading from stdin
" hack to fix https://github.com/vim/vim/issues/5571
autocmd StdinReadPost * set nomodified

" commands specifically for pager
nmap q :q! <Enter>
" the following `set` doesn't work :(
set filetype=none

