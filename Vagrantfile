# vim: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.provider 'docker' do |docker|
    docker.name = 'dotfiles'
    docker.build_dir = '.'
    docker.build_args = ['--tag=dotfiles']
    docker.remains_running = false
  end
end

