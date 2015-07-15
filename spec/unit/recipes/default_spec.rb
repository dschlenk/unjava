#
# Cookbook Name:: unjava
# Spec:: default
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


require 'spec_helper'

describe 'unjava::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::Runner.new
      runner.converge(described_recipe)
    end

    it 'converges unsuccessfully' do
      expect{
        chef_run
      }.to raise_error # This should raise an error
    end

  end
  context 'When all attributes are default, on centos platform' do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(platform: 'centos', version: '5.11') do |node|
#        node.set[:unjava][:resources] = [
#            'java_alternatives[set-java-alternatives]',
#            'ruby_block[set-env-java-home]',
#            'directory[/etc/profile.d]',
#            'file[/etc/profile.d/jdk.sh]'
#        ]
      end
      runner.converge('role[java_unjava]')
    end

    it 'does not install java' do
      # assert openjdk packages not installed
      jdk = chef_run.package('java-1.6.0-openjdk')
      expect(jdk).to do_nothing
      jdk_devel = chef_run.package('java-1.6.0-openjdk-devel')
      expect(jdk_devel).to do_nothing
    end
  end
end
