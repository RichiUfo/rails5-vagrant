#!/usr/bin/env bash

cd ~
rm -rf /var/www/.rvm
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --rails
source /var/www/.rvm/scripts/rvm
rvm autolibs disable
rvm reload
rvm install ruby-2.3.1
rvm use ruby-2.3.1 --default
gem install rake
gem install bundler
gem install rails
