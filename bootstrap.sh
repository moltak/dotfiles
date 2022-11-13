#!/bin/sh

# sdkman
curl -s "https://get.sdkman.io" | bash

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew install
brew update
brew tap homebrew/bundle
brew bundle --file=$HOME/dotfiles/Brewfile

# link
mkdir $HOME/.config
ln -nfs $HOME/dotfiles/clojuredocs    $HOME/clojuredocs 
ln -nfs $HOME/dotfiles/.gitconfig     $HOME/.gitconfig
ln -nfs $HOME/dotfiles/.gitignore     $HOME/.gitignore
ln -nfs $HOME/dotfiles/.zshrc         $HOME/.zshrc
ln -nfs $HOME/dotfiles/ctags.d        $HOME/.ctags.d
ln -nfs $HOME/dotfiles/nvim/init.vim  $HOME/.vimrc
ln -nfs $HOME/dotfiles/nvim           $HOME/.config/nvim
ln -nfs $HOME/dotfiles/iterm2         $HOME/.config/iterm2
ln -nfs $HOME/dotfiles/UltiSnips      $HOME/UltiSnips
ln -nfs $HOME/dotfiles/vim            $HOME/.vim
ln -nfs $HOME/dotfiles/clojuredocs    $HOME/clojuredocs

source $HOME/.zshrc
