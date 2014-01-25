# -*- coding: utf-8 -*-
#
# Cookbook Name:: rails
# Recipe:: ubuntu_ja
#
# Copyright (C) 2013 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

# Run apt-key add to add key
execute 'apt-key-add-archive' do
  command 'wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -'
  ignore_failure false
end

# Run apt-key add to add key
execute 'apt-key-add-ppa' do
  command 'wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -'
  ignore_failure false
end

# Run wget to download source list
execute 'add-source-list' do
  command 'sudo wget https://www.ubuntulinux.jp/sources.list.d/saucy.list -O /etc/apt/sources.list.d/ubuntu-ja.list'
  ignore_failure false
  not_if { ::File.exists?('/etc/apt/sources.list.d/ubuntu-ja.list') }
end

# Run apt-get update
execute 'apt-get-update' do
  command 'apt-get update'
  ignore_failure true
end

# Run apt-get upgrade
execute 'apt-get-upgrade' do
  command 'apt-get upgrade -y'
  ignore_failure false
end

package 'ubuntu-defaults-ja' do
  action :install
end
