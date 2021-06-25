# ~/.bashrc: executed by bash(1) for non-login shells.
alias c='clear'
alias cl='clear && ls -1'
cdl() { cd "$@" && ls -1; }

alias ls='/bin/ls $LS_OPTIONS';
alias ld='ls -1 -d */. | sed "s|/\.||g"'
alias lsf='find . -maxdepth 1 -type f | sed "s|\./||" | grep -v "^\."'
alias lsfa='find . -maxdepth 1 -type f | sed "s|\./||"'
alias ltr='ls -ltr'
alias ll='ls -lh'
alias lla='ls -la'
alias ls='ls --color -h --group-directories-first'
alias l='ls -1'

alias gc='git commit'
alias gcm='git commit -m'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gs='git status'
alias gl="git log --graph --date-order -C -M --pretty=format:\"<%h> %Cgreen%d%Creset %s\" --all --date=short"
alias glg="git log --graph --date-order -C -M --pretty=format:\"<%h> %Cgreen%d%Creset %s\" --all --date=short"
alias glw="watch -n 1 -c 'git log --graph --date-order -C -M --pretty=format:\"<%h> %Cgreen%d%Creset %s\" --all --date=short'"
alias wgl="watch -n 1 -c 'git log --graph --date-order -C -M --pretty=format:\"<%h> %Cgreen%d%Creset %s\" --all --date=short'"
alias gitfilemode='git config core.filemode false'
alias groot='cd $(git rev-parse --show-toplevel)'

alias dcc='drush cc all'
alias ds='drush status'
alias dul='drush uinf $(drush sqlq "SELECT GROUP_CONCAT(uid) FROM users")'
alias droot='cd $(git rev-parse --show-toplevel) && cd docroot'

alias vi='vim'
alias vimrc='vi ~/.vimrc'
alias bashrc='vi ~/.bashrc && source ~/.bashrc'

alias ww='cd ~/clientsite.prod/docroot' # @TODO: update clientsite.prod actual directory

ginit() {
  git init
  echo "*~\n*.swp\n*.tmp\n*.tar\n*.tar.gz\n*.tgz\n*.zip\n*.sql" > .gitignore
  git add .gitignore
  git commit -m "Begin."
}
sedall() {
  [ "$#" = 2 ] || { echo Two arguments needed; return 9; }
  find . -type f -exec sed -i "s|$1|$2|g" {} \;
}

export EDITOR=vim

export HISTTIMEFORMAT="%y/%m/%d %T "

export PATH="$HOME/bin:/var/www/html/bin:$PATH"

export DRUSH_OPTIONS_URI="$DDEV_PROJECT.ddev.site"

#source /usr/share/bash-completion/completions/git
source /etc/bash_completion.d/git

# COMMAND PROMPT
# to see available colors, run the following command:
# for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""
# https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal
# for fancy unicode characters see:
# http://www.amp-what.com/unicode/search/down%20arrow & https://unicode-table.com/en/#control-character

#store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
DGREEN="\e[2;36;40m"
RED='\e[6;31;40m'
BLUE="\e[2;34;40m"
WHITE='\[\033[0m\]'
PURPLE='\e[2;35;40m'
DGREY='\e[2;37;40m'
 
CLIENT="$DDEV_PROJECT"

function color_my_prompt {
  local __client="$DGREY$CLIENT"
  local __cur_location="$PURPLE\w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$DGREEN"
  local __user_input_color="$WHITE"
  local __git_branch=$(__git_ps1); 
  
  # colour branch name depending on state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_GRAY"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$GREEN"
  fi
   
  # Build the PS1 (Prompt String)
  PS1="\nDDEV:$__client $__cur_location$__git_branch_color$__git_branch \n$__user_input_color "
}
 
# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
 
# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi
# END OF COMMAND PROMPT

LS_OPTIONS='--color=tty -F -a -b -T 0';
export LS_OPTIONS;
# Colorize `ls` output:
# di = directory
# fi = file
# ln = symbolic link
# pi = fifo file
# so = socket file
# bd = block (buffered) special file
# cd = character (unbuffered) special file
# or = symbolic link pointing to a non-existent file (orphan)
# mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
# ex = file which is executable (ie. has 'x' set in permissions).
# ----
# 0  = default colour   |   31  = red       |   91  = light red
# 1   = bold            |   32  = green     |   92  = light green
# 4   = underlined      |   33  = orange    |   93  = yellow
# 5   = flashing text   |   34  = blue      |   94  = light blue
# 7   = reverse field   |   35  = purple    |   95  = light purple
#                       |   35  = cyan      |   96  = turquoise
#                       |   37  = grey
# 
# 40  = black background    |   100 = dark grey background
# 41  = red background      |   101 = light red background
# 42  = green background    |   102 = light green background
# 43  = orange background   |   103 = yellow background
# 44  = blue background     |   104 = light blue background
# 45  = purple background   |   105 = light purple background
# 46  = cyan background     |   106 = turquoise background
# 47  = grey background     |   
# 90  = dark grey
LS_COLORS='fi=0;94:rs=0:di=01;36:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=0;95:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
