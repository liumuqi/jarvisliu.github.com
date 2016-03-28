# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="kphoen"
ZSH_THEME="pygmalion"

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
plugins=(git git-flow-avh mvn go golang docker brew jump osx gem)

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
PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
alias tmux='tmux -2u'
alias tc='tmux new-session -s lmq'
alias gvim='setgo;vim'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gall='for i in `ls`; do echo "begin---->"$i && $(cd  $i && git pull --rebase) ; done'
export TERM='screen-256color'

#export GOPATH="/Users/lmq/Documents/mogujie_code/recommender/remosis/agent:/Users/lmq/golibs"
export GOPATH="/Users/lmq/golibs"
export GOROOT="/usr/local/go"
export JAVA6HOME="/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
export JAVA7HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
export JAVA8HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"
export GO15VENDOREXPERIMENT=1
export TESLA_HOME=/Users/lmq/worksoft/tesla-tool
export  MAVEN_HOME=/Users/lmq/worksoft/apache-maven-3.2.2
export MYRUN=/Users/lmq/shell/
export PATH=/Users/lmq/bin:/Users/lmq/golibs/bin:$MYRUN:$MAVEN_HOME/bin:$TESLA_HOME/bin:$PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
jdk6(){
    export PATH=$JAVA6HOME/bin:$PATH
    export JAVA_HOME=$JAVA6HOME
}
jdk7(){
    export PATH=$JAVA7HOME/bin:$PATH
    export JAVA_HOME=$JAVA7HOME
}
jdk8(){
    export PATH=$JAVA8HOME/bin:$PATH
    export JAVA_HOME=$JAVA8HOME
}
jdk7
setgo(){
    p=$(pwd)
    if [[ $p == *"/src/"* ]] then
        #index=
        export GOPATH="${p/%src*/}:/Users/lmq/golibs"
    else
        export GOPATH="$(pwd):/Users/lmq/golibs"
    fi
}
source $ZSH/oh-my-zsh.sh
