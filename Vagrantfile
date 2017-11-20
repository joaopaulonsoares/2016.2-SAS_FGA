# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/xenial64"

    web.vm.network "forwarded_port", guest: 8000, host: 8000
    web.vm.network "private_network", ip: "192.168.1.10"

    web.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
    end

    web.vm.provision "shell", inline: "apt-get install -y python"
    web.vm.provision "shell", inline: "apt-get install python3-setuptools"
    web.vm.provision "shell", inline: "easy_install3 pip"

    web.vm.provision "shell", inline: <<-SHELL
      cd /vagrant/
      pip install -r requirements.txt
     SHELL

    web.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end
