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
  deb_pkgs = ['openjdk-6-jdk', 'openjdk-6-jre-headless']
  rhel_pkgs = ['java-1.6.0-openjdk', 'java-1.6.0-openjdk-devel']
  bsd_pkgs = ['openjdk6']
  platforms = {
    'ubuntu-12.04' => {
      'packages' => deb_pkgs
    },
    'ubuntu-14.04' => {
      'packages' => deb_pkgs
    },
    'debian-6.0.5' => {
      'packages' => deb_pkgs
    },
    'debian-7.8' => {
      'packages' => deb_pkgs
    },
    'centos-5.8' => {
      'packages' => rhel_pkgs
    },
    'centos-5.9' => {
      'packages' => rhel_pkgs
    },
    'centos-5.10' => {
      'packages' => rhel_pkgs
    },
    'centos-5.11' => {
      'packages' => rhel_pkgs
    },
    'centos-6.0' => {
      'packages' => rhel_pkgs
    },
    'centos-6.3' => {
      'packages' => rhel_pkgs
    },
    'centos-6.4' => {
      'packages' => rhel_pkgs
    },
    'centos-6.5' => {
      'packages' => rhel_pkgs
    },
    'centos-6.6' => {
      'packages' => rhel_pkgs
    },
    'centos-7.0' => {
      'packages' => rhel_pkgs
    },
    'centos-7.1.1503' => {
      'packages' => rhel_pkgs
    },
    'fedora-20' => {
      'packages' => rhel_pkgs
    },
    'fedora-21' => {
      'packages' => rhel_pkgs
    },
    'freebsd-8.4' => {
      'packages' => bsd_pkgs
    },
    'freebsd-9.1' => {
      'packages' => bsd_pkgs
    },
    'freebsd-9.2' => {
      'packages' => bsd_pkgs
    },
    'freebsd-10.0' => {
      'packages' => bsd_pkgs
    }
  }
  platforms.each do |platform, value|
    os, ver = platform.split '-'
    context "When all attributes are default, on #{platform} platform" do
      let(:chef_run) do
        runner = ChefSpec::Runner.new(platform: os, version: ver)
        runner.converge('role[java_unjava]')
      end

      it 'does not install java' do
        # assert openjdk packages not installed
        value['packages'].each do |p|
          jdk = chef_run.package(p)
          expect(jdk).to do_nothing
        end
      end
    end
  end
end
