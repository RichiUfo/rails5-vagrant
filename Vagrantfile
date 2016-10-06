# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provision :shell, path: '.setup/bootstrap.sh'
  config.vm.synced_folder '.', '/var/www/', owner: 'www-data', group: 'www-data'

  config.vm.provider 'virtualbox' do |vb|
    config.vm.box = 'ubuntu/trusty64'
    config.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 33066, auto_correct: true

    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
