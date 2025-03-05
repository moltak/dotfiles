# PATH
export FLUTTER_BIN="$HOME/sdk/flutter/bin"
export PATH=$PATH:$FLUTTER_BIN
export PATH=$PATH:"$HOME/.pub-cache/bin"
export PATH=$PATH:"$HOME/bin"

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/snap/bin
eval "$(/opt/homebrew/bin/brew shellenv)"

ZSH_THEME="simple"

plugins=(
  git
  zsh-autosuggestions
  fasd
  aws
)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export HOMEBREW_NO_ENV_HINTS=FALSE
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

# 우분투일경우 LANG을 설정
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ]; then
        export LC_ALL="C.UTF-8"
        export LANG="C.UTF-8"
    fi
else
    export LANG=en_US.UTF-8
fi

eval "$(fasd --init auto)"

# android
export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$ANDROID_SDK/tools/bin

# serverless-better-credentials
export AWS_SDK_LOAD_CONFIG=1

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"

# alias
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# rbenv
#PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# cargo
#$HOME/.cargo/env

# Created by `pipx` on 2025-03-04 02:23:10
export PATH="$PATH:/Users/clark/.local/bin"


eval "$(register-python-argcomplete pipx)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/clark/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/clark/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/clark/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/clark/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

