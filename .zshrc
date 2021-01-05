# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s%l
zstyle :compinstall filename '/home/adrian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# Customization
PROMPT='%B%F{magenta}%~%f%b'$'\n''%(?.%F{green}».%F{red}%? »)%f '
RPROMPT='%B%F{cyan}%*%f%b'

precmd() { print "" }

source ~/todotxt/todo_completion.bin

# Aliases
alias ls='ls -lh --color'
alias sshc='ssh -p 4269 pi@192.168.178.31'
alias ytdlp='youtube-dl --cookies /home/adrian/Downloads/cookies.txt'
alias cal='cal --three'
alias zth='zathura'
alias wttr='curl wttr.in/leipzig'
alias t='/home/adrian/todotxt/todo.sh -n'

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autocomplete config
bindkey '^d' autosuggest-accept
bindkey '^x' autosuggest-execute

# exports
export PATH=$PATH:/home/adrian/scripts/:/home/adrian/.emacs.d/bin/
export $(dbus-launch)
export EDITOR=nvim

# terminal greeting
# echo Days until Cyberpunk 2077: $((($(date +%s --date "2020-12-10")-$(date +%s))/(3600*24))) | /home/adrian/Downloads/bashCatWithKitten/cat.sh
t
echo ''
