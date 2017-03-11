# dotfiles

All of the dotfiles. Inspired by [Brady Lill's disruptive thinking](https://github.com/bradylill/dotfiles)

> The definition of insanity is doing the same thing over and over again, but
> expecting different results

## Overview

Install scripts and configuration files for an Ubuntu environment

- ansible
- docker
- git
- gnome-terminal
- google-chrome
- graphics
- kickstart
- packer
- shell
- thefuck
- tools (miscellaneous packages)
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

A basic [vagrant](https://www.vagrantup.com) /
[docker](https://www.docker.com/) environment is provided to test changes made
to this repository.

### Vagrant

    [dotfiles] vagrant docker-run -- /vagrant/setup.sh

### Docker

    [dotfiles] docker build -t dotfiles .
    [dotfiles] docker run -v $(pwd):/dotfiles dotfiles bash /dotfiles/setup.sh
