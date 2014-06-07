#
# Cookbook Name:: tartarus
# Provider:: tartarus
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

# Support whyrun
def whyrun_supported?
	true
end

action :add do
	description = "define #{new_resource.directory} on #{new_resource.cron_minute} #{new_resource.cron_hour} #{new_resource.cron_day} #{new_resource.cron_month} #{new_resource.cron_weekday}"
	converge_by(description) do
		cmd = "#{node['tartarus']['run_path']}/tartarus"
		cmd << " -i" if new_resource.incremental_backup
		cmd << " '#{node['tartarus']['config_path']}/#{new_resource.name}.conf'"
		
		file "#{node['tartarus']['config_path']}/#{new_resource.name}.sec" do
			content new_resource.encrypt_passphrase
			mode 0444
			action :create
		end
		
		file "#{node['tartarus']['timestamps_path']}/#{new_resource.name}" do
			content ""
			mode 0644
			action :create
		end
		
		template "#{node['tartarus']['config_path']}/#{new_resource.name}.conf" do
			source "tartarus.erb"
			cookbook "tartarus"
			variables(
				:tartarus => new_resource
			)
			owner "root"
			group "root"
			mode 0644
		end
	end
end

action :schedule do
	description = "backup #{new_resource.directory} on #{new_resource.cron_minute} #{new_resource.cron_hour} #{new_resource.cron_day} #{new_resource.cron_month} #{new_resource.cron_weekday}"
	converge_by(description) do
		cmd << " >/dev/null 2>&1"
		cron "run_tartarus_profile_#{new_resource.name}" do
			minute new_resource.cron_minute
			hour new_resource.cron_hour
			day new_resource.cron_day
			month new_resource.cron_month
			weekday new_resource.cron_weekday
			command cmd
		end
	end
end

action :run do
	if new_resource.exists
		description = "run tartarus profile #{new_resource.name}"
		converge_by(description) do
			command = "#{node['tartarus']['run_path']}/tartarus"
			command << " -i" if new_resource.incremental_backup
			command << " '#{new_resource.name}'"
			run_tartarus(command, description)
		end
	else
		Chef::Log.warn "#{ current_resource } doesn't exist."
	end
end

def run_tartarus(command, description)
	script "#{description}" do
		interpreter 'bash'
		user "root"
		code <<-EOF
			#{command}
		EOF
	end
end

def load_current_resource
	@current_resource = Chef::Resource::Tartarus.new(@new_resource.name)
	
	if exists?(@current_resource.name)
		@current_resource.exists = true
	end
end

private
def exists?(name)
	begin
		::File.exists?("#{node['tartarus']['config_path']}/#{name}.conf")
	rescue Chef::Exceptions::ShellCommandFailed
	rescue Mixlib::ShellOut::ShellCommandFailed
		false
	end
end
