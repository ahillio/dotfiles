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
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

## fix vi-mode hack begins[
#apparently not necessary just specifiy it in RIGHT_PROMPT below...
#zle-keymap-select () {
#  zle reset-prompt
#  zle -R
#}
#zle -N zle-keymap-select
## fix vi-mode hack ends]
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status history time)
POWERLEVEL9K_VI_MODE_COMMAND_BACKGROUND='teal'
POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="VI-Mode"

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
plugins=(git vi-mode history-substring-search tmuxinator)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/alec/.shellscripts:/home/alec/bin"
export PATH="$HOME/.composer/vendor/bin:/home/alec/.local/bin:$PATH"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

function cdl { cd "$@" && ls -1 }

alias taskrc='vi ~/.taskrc'
alias tigrc='vi ~/.tigrc'
alias vitrc='vi ~/.vit/config.ini'
alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc && source ~/.zshrc'

alias xclip='xclip -sel clip'

alias c='clear'
alias cl='clear && ls -1'

alias gc='git commit'
alias gcm='git commit -m'
alias gcp='git cherry-pick'
alias gdc='git diff --cached'
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
alias ls='ls --color -h --group-directories-first'
alias l='ls -1'

alias o='xdg-open'

alias sedall="find ./ -type f -exec sed -i 's|$1|g' {} \;"
# sed through all files in current directory
# use like: `sedall find|replace`

alias killmux='tmux kill-session -t'
alias dmux='tmux kill-session -t'
alias delmux='tmux kill-session -t'
alias muxa='tmux a -t'
alias mxo='tmux a -t 0'
alias mx0='tmux a -t 0'
alias mx='tmux a -t 1'
alias lmx='tmux ls'

alias repl='psysh'
alias showz='watch -n 1 -c "$1"'
# example:
# showz drush sqlq "select item_id,status,data from advancedqueue where name='gifted_member_welcome' order by item_id desc limit 5"

#function calc { echo "scale=2; $@" | bc  }

alias t='vit'
alias tim='timew summary :id'
alias showtime="sho 'timew summary :id'"
alias timlog='timew summary 2020-01-01 - tomorrow'
alias tnt='tasknote'

alias dot='cd ~/.dotfiles && ls'
alias bin='cd ~/bin && ls'
alias work='cd ~/Work && ls'

alias sysins='vi ~/bin/system-install.sh'
alias vw='vi ~/Documents/wiki/index.mkd'
alias wki='vi ~/Documents/wiki/index.mkd'
alias wiki='vi ~/Documents/wiki/index.mkd'

#The next lines enables shell command completion for Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i 

function stripe-invoices { APIKEY=$(cat ~/.passwords/stripe-live-sk); curl https://api.stripe.com/v1/invoices -u $APIKEY: -G | jq -C '.data[] | {invoice_id: .id, client: .customer_name, amount: .total, status: .status} | .amount = "$" + (.amount/100|tostring)' }
function stripe-balance { APIKEY=$(cat ~/.passwords/stripe-live-sk); stripe balance retrieve --api-key=$APIKEY }
function stripe-payout { APIKEY=$(cat ~/.passwords/stripe-live-sk); stripe payouts create --amount=$1 --currency=usd --api-key=$APIKEY }
function stripe-payouts { APIKEY=$(cat ~/.passwords/stripe-live-sk); stripe payouts list --limit=4 --api-key=$APIKEY | jq '.data[] | {dateCreated: .created | strftime("%Y-%m-%d"), status: .status, depositDate: .arrival_date | strftime("%Y-%m-%d"), amount: .amount,} | .amount = "$" + (.amount/100|tostring)' }
function stripe-logs { APIKEY=$(cat ~/.passwords/stripe-live-sk); stripe logs tail --api-key=$APIKEY }
# jq filters use "select" as keyword:
# | select( .<key> | contains("<value>")) 
# | select( ._id == 611 ) 
