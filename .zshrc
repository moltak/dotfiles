# PATH
export FLUTTER_BIN=/Users/engeng/sdk/flutter/bin
export PATH=$PATH:$FLUTTER_BIN
export PATH=$PATH:"$HOME/.pub-cache/bin"
#export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.vim/plugged/vim-iced/bin

ZSH_THEME="simple"

plugins=(
  git
  zsh-autosuggestions
  fasd
  aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export HOMEBREW_NO_ENV_HINTS=FALSE
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
#alias ctags=$(brew --prefix)/Cellar/ctags/5.8_2/bin/ctags
alias githash="git log --pretty=format:"%H" -n 1|grep -v grep|cut -c 1-10|xargs echo $(git rev-parse --abbrev-ref HEAD|cut -c 1-3)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fasd --init auto)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
#HEROKU_AC_ZSH_SETUP_PATH=/Users/engeng/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# android
export ANDROID_SDK="/Users/engeng/Library/Android/sdk"
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$ANDROID_SDK/tools/bin

# serverless-better-credentials
export AWS_SDK_LOAD_CONFIG=1

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME="/Users/engeng/.sdkman/candidates/java/current"

# rbenv (ruby)
eval "$(rbenv init - zsh)"

# lazy git
XDG_CONFIG_HOME="$HOME/.config"


# rust
export PATH=$PATH:$HOME/.cargo/bin

#if [ "$(arch)" = "arm64" ]; then
#    eval "$(/opt/homebrew/bin/brew shellenv)"
#else
#    eval "$(/usr/local/bin/brew shellenv)"
#    export PATH="/usr/local/opt/game-porting-toolkit-compiler/bin:$PATH"
#fi

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# git
#alias git-grep="f() { git log --grep $1 | xargs -I {} echo {} };f"

function git-grep() {
  git log --grep $1 develop | xargs -I {} echo {}
}

function git-grep-and-then-copy-hash() {
  git log --grep $1 develop | head -n 1 | awk '{print $2}' | pbcopy | pbpaste
}
