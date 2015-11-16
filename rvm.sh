# Install RVM and ruby 2.2
sudo apt-get install curl -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install ruby-2.2
rvm --default use 2.2

# Install bundler and grpc gem
gem install bundler grpc
