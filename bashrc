if [ "Darwin" = 'Darwin' ]; then
    alias ls='ls -G'
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'
fi
alias ll='ls -l'
alias tree='tree -C'


## https://qiita.com/rita_cano_bika/items/63980f09fad03950b254
PS_USER="\[\e[33m\]\u\[\e[0m\]"
PS_HOST="\[\e[32m\]\h\[\e[0m\]"
PS_WORK="\[\e[37;1m\]\W\[\e[0m\]"
PS_SCREEN=""
PS_SSH=""
PS_ATODE=""
PS_HIST=""

if [ -n "${SSH_CLIENT}" ] ; then
#  PS_SSH="(\[\e[36m\]`echo ${SSH_CLIENT} | sed 's/ [0-9]\+ [0-9]\+$//g'`\[\e[0m\])"
  PS_SSH=""
fi

function ps_exit()
{
    a=$?
    if [ $a -ne 0 ]; then
        echo -n "$(echo -ne '\033')[31m";
    else
        echo -n "$(echo -ne '\033')[m";
    fi
    exit $a;
}
PS_EXIT="\[\$(ps_exit)\]\\$\[$(echo -ne '\033')[m\]"

export PS1="[${PS_USER}${PS_SCREEN}@${PS_HOST}${PS_SSH}${PS_ATODE} ${PS_HIST}${PS_WORK}]${PS_EXIT} "
function PS1_su_set() { 
  export PS1="[${PS_USER}${PS_SCREEN}@${PS_HOST}${PS_SSH}${PS_ATODE} ${PS_HIST}${PS_WORK}]\$ "
}


