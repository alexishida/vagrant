# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo Provisionando...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|

  # Allow symbolic links into shared folder ( Execute terminal as the system administrator ) only Windows
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end
  
  config.vm.box_url = "https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/15.04/ubuntu-15.04-amd64.box"
  config.vm.box = "ubuntu/1504"

  config.vm.host_name = "godzilla-kid" 
  config.vm.provision "shell", inline: $script

  config.vm.synced_folder "C:/desenvolvimento", "/home/vagrant/desenvolvimento"

  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
     vb.memory = 2048
     vb.cpus = 4
  end


  # Port forwarding
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # Rails Server
  config.vm.network "forwarded_port", guest: 5432, host: 5432 # Postgres
  config.vm.network "forwarded_port", guest: 15432, host: 15432  # Postgres

  # Arquivos de configuração do provisionamento
  config.vm.provision :shell, :path => "scripts/inicial.sh"
  config.vm.provision :shell, :path => "scripts/git.sh"
  config.vm.provision :shell, :path => "scripts/docker.sh"
  #config.vm.provision :shell, :path => "scripts/ohmyzsh.sh", privileged: false # Coming soon
  config.vm.provision :shell, :path => "scripts/postgresql.sh"
  config.vm.provision :shell, :path => "scripts/rbenv.sh"
  config.vm.provision :shell, :path => "scripts/nvm.sh", privileged: false
  config.vm.provision :shell, :path => "scripts/memcached.sh"
  config.vm.provision :shell, :path => "scripts/redis.sh"
  #config.vm.provision :shell, :path => "scripts/java.sh" #repository not working =(
  config.vm.provision :shell, :path => "scripts/final.sh"

end
