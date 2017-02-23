# dotfiles

All of the dotfiles. inspired by [Brady Lill's disruptive thinking](https://github.com/bradylill/dotfiles)

## Overview

Install scripts and configuration files for an Ubuntu environment

- git
- gnome-terminal
- google-chrome
- graphics
- shell
- thefuck
- tmux
- vagrant
- vim
- virtualbox
- vpn
- zsh

## Pre requisites

- curl

Note that this will be installed as part of the setup script.

## Usage

To install all packages

    [dotfiles] ./setup.sh

To install a single package

    [dotfiles] ./setup.sh vim

## Vagrant / Docker

A basic [https://www.vagrantup.com](vagrant) /
[https://www.docker.com/](docker) environment is provided to test changes made
to this repository.

### Vagrant

    [dotfiles] vagrant docker-run -- /vagrant/setup.sh

### Docker

    [dotfiles] docker build -t dotfiles .
    [dotfiles] docker run -v $(pwd):/dotfiles dotfiles bash /dotfiles/setup.sh
