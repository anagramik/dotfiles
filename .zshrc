# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/npm-global/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
#export PATH=/usr/local/share/npm/bin:$PATH

#Autojump brew
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aleksandar"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/npm-global/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
alias vvvup="cd ~/Work/VVV && vagrant up"
alias vu="vagrant up"
alias vh="vagrant halt"
alias vm="vagrant ssh"
alias vr="vagrant reload"
alias vrp="vagrant reload --provision"
alias vs="vagrant status"
alias vgs="vagrant global-status"
alias cask="brew cask"
alias hosts="sudo vim /etc/hosts"
alias mp3="youtube-dl -x --audio-format mp3 --audio-quality 0"
alias vremeje!="mplayer -playlist http://listen.radionomy.com/psytrance-power-radio.m3u -prefer-ipv4"
alias ctagsl="ctags -R --PHP-kinds=+cf --exclude=node_modules --exclude=vendor --exclude=.git"
#eval "$(docker-machine env default)"
#alias vremeje!="mplayer -playlist ~/Documents/psytrance-power-radio.m3u -prefer-ipv4"
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"