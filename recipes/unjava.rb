#
# Cookbook Name:: unjava
# Recipe:: default
#
# Copyright 2015 Spanlink Communications, Inc.
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

chef_gem 'chef-rewind'
require 'chef/rewind'

case node['platform_family']
when 'debian', 'rhel', 'fedora', 'freebsd'
  node.set[:java][:install_flavor] = 'openjdk'
  # for some reason unwinding packages doesn't work so instead we change action
  node[:java][:openjdk_packages].each do |p|
    begin
      resources("package[#{p}]").action node[:unjava][:package_action]
    rescue
      Chef::Log.warn "Unable to change action on package #{p}."
    end
  end
  node[:unjava][:resources].each do |r|
    begin
      unwind r
    rescue
      Chef::Log.warn "Unable to unwind resource #{r} on #{node[:platform]}."
    end
  end
else
  raise "Preventing Java installation in #{node[:platform_family]} not supported so readding not necessary."
end
