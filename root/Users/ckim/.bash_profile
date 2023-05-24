


alias server15_tun0='sudo ssh -Tf -w 0:0 server15 "ip a add 192.168.123.1/24 dev tun0 && ip l set up tun0 " ; sudo ifconfig tun0 192.168.123.2 192.168.123.1  ; sudo route -n add 192.168.122.0/24 192.168.123.1'

alias textwrangler='open -a TextWrangler'


#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LSCOLORS=ExFxBxDxCxegedabagacad

export LANG=en_US.UTF-8
export LC_ALL=${LANG}

export KOPS_STATE_STORE=s3://clusters.k8-dev.pslab.org
#export PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "
#export PS1="\[\033[1;34m\]\u@\h:\w$\[\033[0m\] "


#export PATH="/usr/local/opt/icu4c/bin:$PATH"
#export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
