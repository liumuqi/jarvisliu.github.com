# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="dst"
set -o vi
#ZSH_THEME="philips"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras git-flow-avh mvn golang docker docker-compose brew jump osx gem svn rust rustup cargo ripgrep kubectl helm zsh-autosuggestions zsh-syntax-highlighting)

bindkey -v
bindkey "^?" backward-delete-char
bindkey -M vicmd "^R" redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "ga" what-cursor-position
bindkey -M viins '^p' history-beginning-search-backward
bindkey -M vicmd '^p' history-beginning-search-backward
bindkey -M viins '^n' history-beginning-search-forward
bindkey -M vicmd '^n' history-beginning-search-forward

zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# ..() Switch to parent directory by matching on partial name {{{1
# Usage:
# cd /usr/share/doc/zsh
# .. s      # cd's to /usr/share

function .. () {
    (( $# == 0 )) && { cd .. && return }
    local match_idx
    local -a parents matching_parents new_path
    parents=( ${(s:/:)PWD} )
    matching_parents=( ${(M)${parents[1,-2]}:#"${1}"*} )
    if (( ${#matching_parents} )); then
        match_idx=${parents[(i)${matching_parents[-1]}]}
        new_path=( ${parents[1,${match_idx}]} )

        cd "/${(j:/:)new_path}"
        return $?
    fi
    return 1
}

# {{{ genpass()
# Generates a tough password of a given length

function genpass() {
    if [ ! "$1" ]; then
        echo "Usage: $0 20"
        echo "For a random, 20-character password."
        return 1
    fi
    dd if=/dev/urandom count=1 2>/dev/null | tr -cd 'A-Za-z0-9!@#$%^&*()_+' | cut -c-$1
}

function getuuid {
    uuid=$(uuidgen | tr 'A-Z' 'a-z' | tr -d '\n')
    (osascript -e "display notification with title \"⌘-V to paste\" subtitle \"$uuid\"" &) >/dev/null 2>&1
    echo -n "$uuid" | pbcopy
}
#export -f getuuid

# }}}
# Output total memory currently in use by you {{{1

memtotaller() {
    /bin/ps -u $(whoami) -o pid,rss,command | awk '{sum+=$2} END {print "Total " sum / 1024 " MB"}'
}


# }}}
# xssh {{{1
# Paralelize running shell commands through ssh on multiple hosts with xargs
#
# Usage:
#   echo uptime | xssh host1 host2 host3
#
# Usage:
#   xssh host1 host2 host3
#   # prompts for commands; ctrl-d to finish
#   free -m | awk '/^-/ { print $4, "MB" }'
#   uptime
#   ^d

function xssh() {
    local HOSTS="${argv}"
    [[ -n "${HOSTS}" ]] || return 1

    local tmpfile="/tmp/xssh.cmd.$$.$RANDOM"
    trap 'rm -f '$tmpfile SIGINT SIGTERM EXIT

    # Grab the command(s) from stdin and write to tmpfile
    cat - > ${tmpfile}

    # Execute up to 5 ssh processes at a time and pipe tmpfile to the stdin of
    # the remote shell
    echo -n "${HOSTS[@]}" | xargs -d" " -P5 -IHOST \
        sh -c 'ssh -T HOST < '${tmpfile}' | sed -e "s/^/HOST: /g"'
}


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
#export LANG=en_US.UTF-8
export LANG=zh_CN.UTF-8

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#alias urlencode='python -c "import urllib2, sys; print urllib2.quote(sys.stdin.read().encode(\"utf8\"))"'
#alias urldecode='python -c "import urllib2, sys; print urllib2.unquote(sys.stdin.read().encode(\"utf8\"))"'
alias urlencode='python -c "import urllib2, sys; print urllib2.quote(sys.argv[1].encode(\"utf8\"))"'
alias urldecode='python -c "import urllib2, sys; print urllib2.unquote(sys.argv[1].encode(\"utf8\"))"'




PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
alias ls='lsd -l'
alias ll='lsd -l'
alias tmux='tmux -2u'
alias tc='tmux new-session -s lmq'
alias gvim='setgo;vim'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gall='for i in `ls`; do echo "begin---->"$i && $(cd  $i && git pull --rebase) ; done'
alias fetchall="find . -type d -name .git -print0| xargs -0 -I@  sh -c 'echo @;git --git-dir=@ fetch -a'"
alias t='/usr/bin/time -f "%Uu %Ss %er %MkB %C"'
alias ydl='proxychains4 youtube-dl'
alias csc='cscope -Rbkq'
#alias mctags='ctags -R'
alias rsync_code='rsync -av --exclude ".git" --exclude=".idea" --exclude="target/" '
alias topc="ps -eL -o pid,%cpu,lwp|sort -nr -k2|awk '{printf(\"%s %s %x\n\",\$1,\$2,\$3)}'"
#alias java_home='/usr/libexec/java_home'
alias memacs='emacs -nw'
#export TERM='screen-256color'
export TERM='xterm-256color'

#export GOPATH="/Users/lmq/Documents/mogujie_code/recommender/remosis/agent:/Users/lmq/golibs"
export GOPATH="/Users/lmq/.golibs"
export GOROOT="/usr/local/Cellar/go/1.16.3/libexec/"
#export JAVA6HOME="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
#export JAVA7HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
#export JAVA8HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home"
#export JAVA10HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home"
#export GO15VENDOREXPERIMENT=1
export  MAVEN_HOME=/Users/lmq/worksoft/apache-maven-3.6.3/
export MYRUN=/Users/lmq/shell/
export PATH=$GOPATH/bin:$MYRUN:$MAVEN_HOME/bin:$TESLA_HOME/bin:$PATH
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
export SSLKEYLOGFILE=/Users/lmq/.tls/sslkeylog.log
#export DOCKER_IP=`boot2docker ip`
#export DOCKER_HOST=`boot2docker socket`
export SH=/Users/lmq/Documents/code/alibaba/gitlab/shell/code_effect
export odpscmd=/Users/lmq/Documents/code/alibaba/tools/odps_clt_release_64/bin
export PATH=$odpscmd:$SH:$PATH
#alias commands to enable easy setting of JDK version
alias setJDK7='export JAVA_HOME=`unset JAVA_HOME;/usr/libexec/java_home -v 1.7`'
alias setJDK8='export JAVA_HOME=`unset JAVA_HOME;/usr/libexec/java_home -v 1.8`'
alias setJDK10='export JAVA_HOME=`unset JAVA_HOME;/usr/libexec/java_home -v 10`'
# set to the default JDK
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

#
#jdk6(){
    #export PATH=$JAVA6HOME/bin:$PATH
    #export JAVA_HOME=$JAVA6HOME
#}
#jdk7(){
    #export PATH=$JAVA7HOME/bin:$PATH
    #export JAVA_HOME=$JAVA7HOME
#}
#jdk8(){
    #export PATH=$JAVA8HOME/bin:$PATH
    #export JAVA_HOME=$JAVA8HOME
#}
#jdk10(){
    #export PATH=$JAVA10HOME/bin:$PATH
    #export JAVA_HOME=$JAVA10HOME
#}

#jdk8
setgo(){
    p=$(pwd)
    if [[ $p == *"/src/"* ]] then
        #index=
        export GOPATH="${p/%src*/}:/Users/lmq/.golibs"
    else
        export GOPATH="$(pwd):/Users/lmq/.golibs"
    fi
}

function jhome(){
 export JAVA_HOME="`unset JAVA_HOME;/usr/libexec/java_home -v $1`"
}
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env
#source /Users/lmq/Documents/code/github/emsdk/emsdk_env.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/lmq/.sdkman"
[[ -s "/Users/lmq/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lmq/.sdkman/bin/sdkman-init.sh"
export TMUX_POWERLINE_SEG_DATE_FORMAT='%Y-%m-%d %H:%M:%S'
#export PATH=/usr/local/opt/protobuf@2.6/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN="21e43a6d2e8e0e9965a7d34ee6b9063dbe67e453"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

#function exists { which $1 &> /dev/null }

#if exists percol; then
    #function percol_select_history() {
        #local tac
        #exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        #BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        #CURSOR=$#BUFFER         # move cursor
        #zle -R -c               # refresh
    #}

    #zle -N percol_select_history
    #bindkey '^R' percol_select_history
#fi

#eval $(/opt/homebrew/bin/brew shellenv)
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"

#export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
#export LDFLAGS="-L/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include"
# 58172d7efb76a6666f5a0652aecf87d058d18631  vscode syncing
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/opt/google/bin:$PATH"
export PATH="/Users/lmq/Downloads/worksoft/apache-ant-1.10.9/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#fzfp() {
#    fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always{} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'
#}
alias f='fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always{} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'"'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,.idea}"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,.idea}" | fzf --preview '"'"'[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always{} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'"'"
#export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
#export FZF_DEFAULT_OPTS='—height=40% —preview="cat {}" —preview-window=right:60%:wrap'
alias vif='vim `f`'
alias ef='emacs -nw `f`'
alias curltime='curl -w '"'"'"time_redirect": %{time_redirect},
"time_namelookup": %{time_namelookup},
"time_connect": %{time_connect},
"time_appconnect": %{time_appconnect},
"time_pretransfer": %{time_pretransfer},
"time_starttransfer": %{time_starttransfer},
"time_total": %{time_total},
"size_request": %{size_request},
"size_upload": %{size_upload},
"size_download": %{size_download},
"size_header": %{size_header}\n '"'"' -o /dev/null -s '
#alias mxxlonline='mysql -ubtd-xxl-job-prod-admin -h10.218.2.100 -P8201 -plrkeZ5F5chrdlww'
#alias mbtdonline='mysql -uBTD-pub -h10.10.3.30 -P5729 -pMd3Vaodfs'
alias rgf="rg --files | rg"

source ~/.powerlevel10k/powerlevel10k.zsh-theme
#export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
export http_proxy=http://127.0.0.1:12639
export https_proxy=http://127.0.0.1:12639
export no_proxy=localhost,127.0.0.1,.oa.com,.qq.com,.tencent.com
export GOPRIVATE=git.code.oa.com,git.woa.com
export GOPROXY="https://goproxy.woa.com,direct"
export GOSUMDB="sum.woa.com+643d7a06+Ac5f5VOC4N8NUXdmhbm8pZSXIWfhek5JSmWdWrq7pLX4"
export GONOPROXY="git.code.oa.com,git.woa.com,github.com"
export GONOSUMDB="git.code.oa.com,git.woa.com"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
