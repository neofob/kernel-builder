# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 expandtab :

require 'yaml'

# Read yaml node definitions to create **Update nodes.yml to reflect any changes
nodes = YAML.load_file('nodes.yml')


$script = <<-SCRIPT
sudo apt-get update
sudo apt-get dist-upgrade -yq
sudo apt-get install -yq python3-minimal python3-apt python3-pip mc vim-nox
sudo apt-get install -yq build-essential bison flex libssl-dev libelf-dev bc
date > /etc/vagrant_provisioned_at
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  nodes.each do |nodes|
    config.vm.define nodes["name"] do |node|
      node.vm.hostname = nodes["name"]
      node.vm.box = nodes["box"]

      node.vm.provider "virtualbox" do |vb|
        vb.memory = nodes["memory"]
        vb.cpus = nodes["cpus"]
      end
    end
  end

  config.vm.provision "shell", inline: $script
end
