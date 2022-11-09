# ruby version manager
brew install rbenv ruby-build

# install ruby
rbenv init
rbenv install 2.7.6
rbenv global 2.7.6

get install bunlder

# eventmachine (open ssl version 지정)
gem install eventmachine -- --with-openssl-dir=/usr/local/opt/openssl@1.1

gem install jeykill
