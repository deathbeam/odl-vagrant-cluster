# -*- mode: ruby -*-
# vi: set ft=ruby :

$set_password = <<SCRIPT
  echo "ubuntu:ubuntu" | sudo chpasswd
SCRIPT

$prepare_home = <<SCRIPT
  rm -rf /home/ubuntu/bin
  mkdir -p /home/ubuntu/bin
SCRIPT

$chmod_home = <<SCRIPT
  chmod +x /home/ubuntu/bin/*
SCRIPT

$install_java = <<SCRIPT
  apt-get update
  apt-get install -y \
    wget \
    git \
    unzip \
    openjdk-8-jdk
SCRIPT

$install_mininet = <<SCRIPT
  apt-get update
  git clone git://github.com/mininet/mininet
  ./mininet/util/install.sh -a
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "vidla" do | h |
    h.vm.host_name = "vidla"
    h.vm.network :private_network, ip: "10.0.42.201", virtualbox__intnet: true
    h.vm.provision "shell", inline: $set_password
    h.vm.provision "shell", inline: $install_java
    h.vm.provision "shell", privileged: false, inline: $prepare_home
    h.vm.provision "file", source: "./bin/odlCtrlStatus.sh", destination: "/home/ubuntu/bin/odlCtrlStatus.sh"
    h.vm.provision "file", source: "./bin/odlCtrlNetstat.sh", destination: "/home/ubuntu/bin/odlCtrlNetstat.sh"
    h.vm.provision "file", source: "./bin/odlCtrlFindPid.sh.sh", destination: "/home/ubuntu/bin/odlCtrlFindPid.sh"
    h.vm.provision "shell", privileged: false, inline: $chmod_home
    h.vm.network "forwarded_port", guest: 6653, host: 6654, host_ip: "127.0.0.1"
  end

  config.vm.define "zbydla" do | h |
    h.vm.host_name = "zbydla"
    h.vm.network :private_network, ip: "10.0.42.202", virtualbox__intnet: true
    h.vm.provision "shell", inline: $set_password
    h.vm.provision "shell", inline: $install_java
    h.vm.provision "shell", privileged: false, inline: $prepare_home
    h.vm.provision "file", source: "./bin/odlCtrlStatus.sh", destination: "/home/ubuntu/bin/odlCtrlStatus.sh"
    h.vm.provision "file", source: "./bin/odlCtrlNetstat.sh", destination: "/home/ubuntu/bin/odlCtrlNetstat.sh"
    h.vm.provision "file", source: "./bin/odlCtrlFindPid.sh.sh", destination: "/home/ubuntu/bin/odlCtrlFindPid.sh"
    h.vm.provision "shell", privileged: false, inline: $chmod_home
    h.vm.network "forwarded_port", guest: 6653, host: 6655, host_ip: "127.0.0.1"
  end

  config.vm.define "kydla" do | h |
    h.vm.host_name = "kydla"
    h.vm.network :private_network, ip: "10.0.42.203", virtualbox__intnet: true
    h.vm.provision "shell", inline: $set_password
    h.vm.provision "shell", inline: $install_java
    h.vm.provision "shell", privileged: false, inline: $prepare_home
    h.vm.provision "file", source: "./bin/odlCtrlStatus.sh", destination: "/home/ubuntu/bin/odlCtrlStatus.sh"
    h.vm.provision "file", source: "./bin/odlCtrlNetstat.sh", destination: "/home/ubuntu/bin/odlCtrlNetstat.sh"
    h.vm.provision "file", source: "./bin/odlCtrlFindPid.sh.sh", destination: "/home/ubuntu/bin/odlCtrlFindPid.sh"
    h.vm.provision "shell", privileged: false, inline: $chmod_home
    h.vm.network "forwarded_port", guest: 6653, host: 6656, host_ip: "127.0.0.1"
  end

  config.vm.define "mininet" do | h |
    h.vm.host_name = "mininet"
    h.vm.network :private_network, ip: "10.0.42.222", virtualbox__intnet: true
    h.vm.provision "shell", inline: $set_password
    h.vm.provision "shell", inline: $install_mininet
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
