
alias ls='ls -G'
alias ll='ls -alF'
alias rsync-ssh='rsync -avz -e ssh'

# install go by 'brew install golang'
export GOPATH=~/go

# item2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

