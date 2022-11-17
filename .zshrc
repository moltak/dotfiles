# PATH
export FLUTTER_BIN=/Users/engeng/sdk/flutter/bin
export PATH=$PATH:$FLUTTER_BIN
export PATH=$PATH:"$HOME/.pub-cache/bin"
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

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
HEROKU_AC_ZSH_SETUP_PATH=/Users/engeng/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# android
export ANDROID_SDK="/Users/engeng/Library/Android/sdk"
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$ANDROID_SDK/tools/bin

# serverless-better-credentials
export AWS_SDK_LOAD_CONFIG=1

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# rbenv (ruby)
eval "$(rbenv init - zsh)"

# lazy git
XDG_CONFIG_HOME="$HOME/.config"
