# debug
#set -x
# end debug


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="avit"
# ZSH_THEME="bureau"
ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=false // true/false makes no difference :(
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
# @NOTE the difference between "_ON_" and not "_ADD_"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status history battery time)
POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="VI-Mode"
#POWERLEVEL9K_VI_MODE_COMMAND_BACKGROUND='grey35' // doesn't seam to do anything (why?)
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='025'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="grey"
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='grey'
# `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='024'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='094'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
# directories
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='094'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='110'
POWERLEVEL9K_DIR_HOME_FOREGROUND='056'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='062'
POWERLEVEL9K_COLOR_SCHEME='dark'

source $ZSH/oh-my-zsh.sh
# If using oh-my-zsh turn off the damn update check!
DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode history-substring-search)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/alec/code/bin"
export PATH="$HOME/.composer/vendor/bin:/home/alec/.local/bin:$PATH"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# export MANPATH="/usr/local/man:$MANPATH"

# source ~/bin/tmuxinator.zsh
# source /usr/local/src/drush/drush.complete.sh
# source ~/bin/wp-completion.bash

# I'm not sure why this is here or what it does
# autoload bashcompinit
# bashcompinit


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# z utility, track cd destinations for easy moving
# @TODO install Z
# . ~/bin/z/z.sh

# replace standard `mv` command
# check if destination exists, if not then create it
# sadly doesn't work :(
# function mv ()
# {
# 	dir="$2"
# 	tmp="$2"; tmp="${tmp: -1}"
# 	[ "$tmp" != "/" ] && dir="$(dirname "$2")"
# 	[ -a "$dir" ] ||
# 		mkdir -p "$dir" &&
# 		mv "$@"
# }

source ~/.dotfiles/tmuxinator.zsh


# if [ -f ~/.drush/drush.zshrc ] ; then
#     . ~/.drush/drush.zshrc
# fi


# Change cursor to represent command/insert modes
# https://emily.st/2013/05/03/zsh-vi-cursor/
# though she comments-out that section here:
# https://github.com/emilyst/home/blob/master/.zshrc
# function zle-keymap-select zle-line-init
# {
#     # change cursor shape in iTerm2
#     case $KEYMAP in
#         vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
#         viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
#     esac
# 
#     zle reset-prompt
#     zle -R
# }
# 
# function zle-line-finish
# {
#     print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
# }
# 
# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select
# end of cursor mode function

# Ctrl+s freezes terminal (requiring Ctrl+q to un-freeze)
# so disable the terminal scroll lock setting:
stty -ixon

# `ls` autocomplete should not give files as options, only directories
#      (why would I want to `ls some-dir/filename`?
compdef _dirs ls

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

function cdl { cd "$@" && ls -1 }

alias taskrc='vi ~/.taskrc'
alias tigrc='vi ~/.tigrc'
alias vitrc='vi ~/.vit/config.ini'
alias vimrc='vi ~/.vimrc'
# @TODO: `zshrc` alias should also do `tmux send-keys "source ~/.zshrc"` to all panes
alias zshrc='vi ~/.zshrc && source ~/.zshrc'

alias xclip='xclip -sel clip'

alias ical='khal interactive'
cal() {
  if [ $# -eq 0 ]; then
   clear; ncal -b3M; khal list
  else
    if [ $1 = '-c' ] || [ $1 = 'c' ] || [ $1 = 'cal' ]; then
      khal calendar
    elif [ $1 = '-l' ] || [ $1 = 'l' ]; then
      khal list
    elif [ $1 = '-i' ] || [ $1 = 'i' ]; then
      khal interactive; clear; ncal -b3M; khal list
#    elif [ $1 = '-m' ] || [ $1 = 'm']; then
#      ncal -bM
    else
      khal $@
    fi
  fi
}
alias calendar="ncal -bM"
alias calender="ncal -bM"
alias calndr="ncal -bM"

alias c='clear'
alias cl='clear && ls -1'

alias ga='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gs='git status'
alias gl='git vlog'
alias glg="watch -n 1 -c 'git log --graph --date-order -C -M --pretty=format:\"<%h> %Cgreen%d%Creset %s\" --all --date=short'"
alias gitit='git init && cp ~/bin/inc/gitignore .gitignore && git add .gitignore && git commit -m "Begin."'
alias gitfilemode='git config core.filemode false'
alias ts='tig status'
alias gst='tig status'

alias groot='cd $(git rev-parse --show-toplevel)'
alias droot='cd $(git rev-parse --show-toplevel) && cd docroot'
alias dcc='drush cc all'
alias dfc='drush fc'
alias denv='drush vget environment_indicator_overwritten_name'
alias dli='drush @self uli --no-browser | xclip'
alias ds='drush status'
alias dle='drush eval "print_r(array_keys(entity_get_info()));"'
# alias drush8='~/.drush8/vendor/bin/drush'
alias drush8='~/.drush8/vendor/drush/drush/drush'
alias restart='echo "lOv13!" | sudo -S shutdown -r now'
alias ww='cd ~/www && l'

alias dev='ddev'
alias dv='ddev'

alias sshc='vi ~/.ssh/config'

alias untar='tar -xvf'
showport() {
  sudo netstat -ltnp | grep -w "$1"
}

alias ld='ls -1 -d */. | sed "s|/\.||g"'
#alias lsd='ls -1 -d */. | sed "s|/\.||g"'
#alias lsd='ll | grep -e "^d" | grep -v " \."'
#alias lsd='ll | grep -e "^d" | grep -v " \." | cut -c50-'
#alias lsd='ll | grep -e "^d" | grep -v " \." | sed "s|^.*(\s\d{2}:\d{2}\s)||g"'
alias lsf='find . -maxdepth 1 -type f | sed "s|\./||" | grep -v "^\."'
alias lsfa='find . -maxdepth 1 -type f | sed "s|\./||"'
# alias lsfa='ls -p | grep -v /'
alias ltr='ls -ltr'
alias ll='ls -lh'
alias lla='ls -la'
#alias ls='ls --color -h --group-directories-first'
myls() {
if [ $# -eq 0 ]; then
  nnn -e
else
  ls $@
fi
}
#alias ls='myls'
alias l='nnn -e'

alias o='xdg-open'

sedall() {
# sed through all files in current directory
# use like: `sedall find replace`
  [ "$#" = 2 ] || { echo Two arguments needed; return 9; }
  # @TODO improve performance:
  #  first grep for $1 sting, then get those list of filenames, and perform sed on those
  #  `ack -lQ` -l prints just filename, -Q disables regex treats metacharacters as literals
  find . -type f -exec sed -i "s|$1|$2|g" {} \;
}

mkcd() {
  mkdir $1 && cd $1
}
alias flength="find . -maxdepth 1 -type f -exec wc -l {} \; | sort -n | sed 's| ./| |g'"

alias killmux='tmux kill-session -t'
alias kmux='tmux kill-session -t'
alias dmux='tmux kill-session -t'
alias delmux='tmux kill-session -t'
alias muxa='tmux a -t'
alias mxo='tmux a -t 0'
alias mx0='tmux a -t 0'
alias mx='tmuxinator start amux'
alias mxa='tmux a -t 0'
alias lmx='tmux ls'
alias amux='mux amux'
mymux() {
if [ $# -eq 0 ]; then
  mux amux
else
  tmux $@
fi
}
#alias tmux='mymux'

alias repl='psysh'
alias showz='watch -n 1 -c "$1"'
# example:
# showz drush sqlq "select item_id,status,data from advancedqueue where name='gifted_member_welcome' order by item_id desc limit 5"

#function calc { echo "scale=2; $@" | bc  }

alias t='vit'
alias tim='timew summary :id'
alias showtime="sho 'timew summary :id'"
alias timlog='timew :id summary 2020-01-01 - tomorrow'
alias tnt='tasknote'
alias projects="task projects | grep -v 'clitools\|none\|.*project.*tasks'"

alias dot='cd ~/.dotfiles && ls'
alias bin='cd ~/code/bin && ls'
alias work='cd ~/Work && ls'
alias down='cd ~/Downloads'
alias doc='cd ~/Documents'

alias linux="hostnamectl"
alias kernel="uname -r"
#alias battery="acpi"
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'

alias bank="pass -c money/bank"
alias workbank="pass -c work/bank"

alias sysins='vi ~/code/bin/system-install.sh'

alias mkpdf="mkdpdf.sh"

alias vw='vi ~/Documents/wiki/index.mkd'
alias wki='vi ~/Documents/wiki/index.mkd'
alias wiki='vi ~/Documents/wiki/index.mkd'
alias techwiki='vi ~/Documents/wiki/tech/index.mkd'
alias tw='vi ~/Documents/wiki/tech/index.mkd'
alias twiki='vi ~/Documents/wiki/tech/index.mkd'
alias wikitaglist="wikitags"
alias taglist="wikitags"
# alias wikitags="grep --color=always -r -e '^:\S*:$' ~/Documents/wiki/*.mkd ~/Documents/wiki/diary/*.mkd | cut -d '/' -f 6,7  "

vip() {
  vim - -u /home/alec/.dotfiles/pager.vimrc
  # the following breaks
  #> /tmp/vip-input.txt
  #vim /tmp/vip-input.txt -u /home/alec/.dotfiles/pager.vimrc
}
ackvim() {
  # @TODO when $2 contains wildcard like `202*` the `*` shell expansion does not occur -- why? Fix this.
  ack --no-color $1 $2 > /tmp/ackvim.txt
  vim -u /home/alec/.dotfiles/pager.vimrc /tmp/ackvim.txt
}
alias ackv='ackvim'
#alias dreams='dreams.py | less -i'
#alias dreams="dreams.py | vim - -c 'set nomodifiable' -c 'set ft=markdown' '+norm Go'"
#alias dreams="dreams.py | view -"
#alias dreams="dreams.py | vim - -c 'set ft=none' '+norm Go'"
alias dreams="diary.py Dreams | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias gratitude="diary.py Gratitudes | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias gratitudes="diary.py Gratitudes | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias struggle="diary.py Struggles | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias struggles="diary.py Struggles | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias challenges="diary.py Struggles | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias reflections="diary.py Reflections | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias accomplishments="diary.py Accomplishments | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"
alias forgiveness="diary.py Forgiveness | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'"

occurrence() {
  tr -s '[:space:]' '[\n*]' | grep -v "^\s*$" | sort | uniq -c | sort -bnr
}
alias occurrences='occurrence'
themes() {
  occurrence | grep -vE '#|to|and|the|\d' | less
}
wikitags() {
  wikitaglist.sh $1 > /tmp/diary-reports/list-of-tags.txt
                  vim /tmp/diary-reports/list-of-tags.txt -u /home/alec/.dotfiles/pager.vimrc
  #wikitaglist.sh $1 | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set nomodifiable' 'set readonly'
}
sleepat() {
  [ ! -d "/tmp/diary-reports" ] && mkdir /tmp/diary-reports
  grep -En '^- sleep|^- \[X\] Sleep|^- \[ \] sleep' ~/Documents/wiki/diary/2021*\
    | sed 's/- sleep//g'\
    | sed 's/- \[x\] sleep//g'\
    | sed 's/- \[ \] sleep//g'\
    | sed 's|/home/alec/Documents/wiki/diary/||g'\
    > /tmp/diary-reports/sleep-at
    vi /tmp/diary-reports/sleep-at  -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'
}
techtag() {
  techtag.py $1 | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'
}
tagshow() {
  [ ! -d "/tmp/diary-reports" ] && mkdir /tmp/diary-reports
  tagshow.py $1 > /tmp/diary-reports/$1.mkd; vi /tmp/diary-reports/$1.mkd -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'
              #vi /tmp/diary-reports/$1.mkd
 #tagshow.py $1 > /tmp/diary-reports/$1.mkd; vi /tmp/diary-reports/$1.mkd
 #tagshow.py $1 | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'
}
tgsho() {
  tagshow.py $1 > /tmp/diary-reports/$1.mkd;
               vi /tmp/diary-reports/$1.mkd
}
oldtagshow() {
  tagshow.py $1 | vim - -u /home/alec/.dotfiles/pager.vimrc -c 'set ft=vimwiki' '+norm Go'
}
alias tags="tagshow"
alias showtag="tagshow"
alias bol="tagshow BoL"

alias vitp="vit +personal"

#alias fb='fb-messenger-cli'
alias fb="pass -c social/facebook"
alias mutt='neomutt'

contacts() {  echo "\`khard\` will list all contacts.\n\`khard edit contact name\` will edit khard file for 'contact name'." }

#The next lines enables shell command completion for Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i 

function stripekey { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe $@ --api-key=$APIKEY }
function stripe-invoices { APIKEY=$(cat ~/.password-store/stripe-live-sk); curl https://api.stripe.com/v1/invoices -u $APIKEY: -G | jq -C '[.data[] | {invoice_id: .id, client: .customer_name, date: .date | strftime("%Y-%m-%d"), amount: .total, status: .status} | .amount = "$" + (.amount/100|tostring)] | sort_by(.date)' }
function stripe-balance { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe balance retrieve --api-key=$APIKEY }
function stripe-payouts { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe payouts list --limit=4 --api-key=$APIKEY | jq '.data[] | {dateCreated: .created | strftime("%Y-%m-%d"), status: .status, depositDate: .arrival_date | strftime("%Y-%m-%d"), amount: .amount,} | .amount = "$" + (.amount/100|tostring)' }
function stripe-payout { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe payouts create --amount=$1 --currency=usd --api-key=$APIKEY }
# @TODO create function for **INSTANT** payouts option
# https://stripe.com/docs/payouts#instant-payouts
# curl https://api.stripe.com/v1/payouts \
#   -u sk_test_VqsaGY0UGjQ8NjldtJcnH7w5: \
#   -d amount=1000 \
#   -d currency=usd \
#   -d method=instant \
#   -d destination=card_xyz
alias stripe-transfer='stripe-payout'
function stripe-logs { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe logs tail --api-key=$APIKEY }
function stripe-customers { APIKEY=$(cat ~/.password-store/stripe-live-sk); stripe customers list --api-key=$APIKEY | jq -C '.data[] | {id: .id, name: .name}'}

# jq filters use "select" as keyword:
# | select( .<key> | contains("<value>")) 
# | select( ._id == 611 ) 


# NVM
# @TODO https://www.ioannispoulakas.com/2020/02/22/how-to-speed-up-shell-load-while-using-nvm/
# re-enable NVM please
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


### Change Konsole colorscheme###
# default BackGroundMode is dark
if [[ ! $(tmux show-environment | grep THEME) =~ 'THEME=light' ]]; then
  tmux set-environment THEME dark
fi
# Breeze | SolarizedLight???
bgd() {
  switch-term-color "colors=Breeze"
  tmux set-environment THEME dark
  # @TODO: update `khal` colorscheme
  #               `vit` colors
}
bgl() {
  switch-term-color "colors=SolarizedLight"
  tmux set-environment THEME light
  # @TODO: update `khal` colorscheme
  #               `vit` colors
}
switch-term-color() {
  arg="${1:-colors=Tomorrow}"
  if [[ -z "$TMUX" ]]
  then
    konsoleprofile "$arg"
  else
    printf '\033Ptmux;\033\033]50;%s\007\033\\' "$arg"
  fi
}
### End of Konsole colorscheme switching ###

fnd() {
  find . -iname "*$1*"
}
# set options for less per https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
#export LESS='--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=2 --window=-4'
##export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=2 --no-init --window=-4'
## Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
#export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
#export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
#export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
#export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
#export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
#export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
#export LESS_TERMCAP_ue=$'\E[0m'        # reset underline 
## for ~/.lessfilter to work:
#eval "$(lesspipe)"

### NNN is configured through environment variables ###


# debug
#set +x
# end debug
