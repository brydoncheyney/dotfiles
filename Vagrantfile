# vim: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.provider 'docker' do |docker|
    docker.build_dir = '.'
    docker.remains_running = false
  end
end

