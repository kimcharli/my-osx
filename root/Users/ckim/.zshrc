autoload -Uz vcs_info
precmd() { vcs_info }

PATH=$HOME/.local/bin:$PATH
export PATH

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -U colors && colors
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[cyan]%}%1~%{$reset_color%} %% "

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

plugins=(git colored-man-pages colorize pip python brew osx zsh-syntax-highlighting zsh-autosuggestions)
ZSH_THEME=pygmalion

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

