Vagrant.configure(2) do |config|

  config.vm.box = "centos66"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"

  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t pact_broker -e [PACT_BROKER_DATABASE_USERNAME={uname}, PACT_BROKER_DATABASE_PASSWORD={pass}, PACT_BROKER_DATABASE_HOST={host}, PACT_BROKER_DATABASE_NAME={dbname}]"
    d.run "pact_broker", args: "-p 9292 -o 0.0.0.0"
  end

end
