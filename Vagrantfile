# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

    # VirtualBox Config
    config.vm.provider "virtualbox" do |v, override|

        # Use Debian Wheezy x86 base box
        # Debian 7.7 box from: https://github.com/opscode/bento
        override.vm.box = "opscode_debian-7.7-i386_chef-provisionerless.box"

        # Improve performance
        v.memory = 768
        v.cpus = 3

    end

    # Framework Server
    config.vm.define "base", primary: true do |base|
        # Forward ports
        base.vm.network "forwarded_port", guest: 5432,  host: 5432   # Postgres

        # Share the salt config
        base.vm.synced_folder "salt/base", "/srv/salt/"

        # Run setup script
        base.vm.provision "shell",
            run: "once",
            inline: '/vagrant/pre-salt.sh'

        # Configure Salt
        base.vm.provision :salt, run: "always" do |salt|
            salt.minion_config = "salt/minion"
            salt.run_highstate = true
        end

        # Run setup script
        base.vm.provision "shell",
            run: "once",
            inline: '/vagrant/post-salt.sh'
    end

end
