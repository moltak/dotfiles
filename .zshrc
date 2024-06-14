# PATH
export PATH=$PATH:"$HOME/.pub-cache/bin"
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# git
#alias git-grep="f() { git log --grep $1 | xargs -I {} echo {} };f"

#function git-grep() {
#  git log --grep $1 develop | xargs -I {} echo {}
#}
#
#function git-grep-and-then-copy-hash() {
#  git log --grep $1 develop | head -n 1 | awk '{print $2}' | pbcopy | pbpaste
#}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ruby
# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# fly
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

source $ZSH/oh-my-zsh.sh
