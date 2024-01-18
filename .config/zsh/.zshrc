# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Need this to be here so that I can use it for the oh.my.zsh theme export
export XDG_CONFIG_DIRS="$HOME/.config"
# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_DIRS/.oh-my-zsh"



# This is to give prompt 2 directories deep 


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases


# alias ohmyzsh="mate ~/.oh-my-zsh"

# User exports 
export SHARED="/home/shared"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$CROSS_COMPILER_BIN:$PATH"
export PATH="$HOME/.config/guix/current/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

CHROME_EXECUTABLE="/opt/google/chrome/chrome"
export CHROME_EXECUTABLE
# export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-18-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export DZSH="$XDG_CONFIG_DIRS/zsh/.zshrc"
export DOTFILES="$HOME/dotfiles"
export CODE="$HOME/code"


export CROSS_COMPILER_BIN="$HOME/opt/cross/bin"

SOURCING_FILES=("/usr/share/nvm/init-nvm.sh" "/opt/ros/noetic/setup.zsh")
echo "sourcing files"
for file in $SOURCING_FILES; 
    do 
        if [[ -f $file ]]; then
            source $file
        else
            echo "$file does not exist"
        fi
    done

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
#[[ -z "$TMUX" ]] && exec tmux


# User aliases
alias dtf="/usr/bin/git --git-dir=$DOTFILES --work-tree=$HOME"
alias get_idf=". $HOME/src/embedded/esp/esp-idf/export.sh"
alias csv_parse="$HOME/code/scripts/csv_parse.zsh"

alias shared="ll -a $SHARED && cd $SHARED"
# alias scratch="/usr/bin/git --git-dir=$HOME/src/scratch.dev/github --work-tree=$HOME/src/scratch.dev"
# alias scratch_pull="/usr/bin/git --git-dir=$HOME/src/scratch.dev/github --work-tree=$HOME/src/scratch.dev pull origin main"
# alias edu="/usr/bin/git --git-dir=$HOME/src/education/github --work-tree=$HOME/src/education"
# alias edu_pull="/usr/bin/git --git-dir=$HOME/src/education/github --work-tree=$HOME/src/education pull origin main"


#related to this file
alias open_rc="code $DZSH"
alias source_rc="source $DZSH"
# User functions
function bin_ln(){
    abs_path=$(realpath "$1")
    # echo $abs_path
    ln -s $abs_path /home/wil/src/bin
}

function work(){
    cd "$CODE/$1"
    la
}


function cfg(){
    la "$XDG_CONFIG_DIRS/$1" && cd "$XDG_CONFIG_DIRS/$1"
}

# sourcing nvm environment
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias config='/usr/bin/git --git-dir=/home/wil/.cfg/.git/ --work-tree=/home/wil'
