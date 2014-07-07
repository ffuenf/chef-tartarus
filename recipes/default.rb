#
# Author::  Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
# Cookbook Name:: chef-tartarus
# Recipe:: default
#
# Copyright 2013, Achim Rosenhagen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
chef_gem "chef-vault"
require 'chef-vault'

passwords_tartarus = chef_vault_item("passwords", "tartarus")
node.set['tartarus']['encrypt_passphrase'] = passwords_tartarus['encrypt_passphrase']
node.set['tartarus']['storage_ftp_server'] = passwords_tartarus['storage_ftp_server']
node.set['tartarus']['storage_ftp_user'] = passwords_tartarus['storage_ftp_user']
node.set['tartarus']['storage_ftp_password'] = passwords_tartarus['storage_ftp_password']

apt_repository node['tartarus']['apt_repository']['name'] do
	uri node['tartarus']['apt_repository']['uri']
	key node['tartarus']['apt_repository']['key']
	action :add
end

%w{ tartarus tar bzip2 lvm2 gnupg curl }.each do |pkg|
	package pkg
end

directory node['tartarus']['config_path'] do
	recursive true
	action :create
end

directory node['tartarus']['timestamps_path'] do
	recursive true
	mode 755
	action :create
end
