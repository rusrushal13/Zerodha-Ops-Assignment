Vagrant.configure("2") do |config|
  config.vm.define "demo-ops" do |server|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
      vb.name = "demo-ops-virtualbox"
    end
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: "127.0.0.1"
  end
  config.vm.synced_folder ".", "/home/vagrant/go/src"
  config.vm.provision "ansible" do | ansible |
    ansible.playbook = "playbook.yml"
    ansible.become = true
    ansible.limit = "all"    
  end
  config.vm.provision "shell", inline: <<-SHELL 
    apt-get update
    apt-get install -y ansible
    chown -R $USER:$USER /home/vagrant/go/
  SHELL
end
