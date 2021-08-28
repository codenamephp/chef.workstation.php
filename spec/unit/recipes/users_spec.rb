# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Spec:: users
#
# Copyright:: 2020, CodenamePHP
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

describe 'codenamephp_workstation_php::users' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates teh chef group' do
      expect(chef_run).to create_group('php')
    end

    it 'creates the chef user' do
      expect(chef_run).to create_user('php').with(
        group: 'php',
        manage_home: true
      )
    end

    it 'copies the ssh key' do
      expect(chef_run).to install_codenamephp_ssh_keys_local_copy('Copy ssh keys for php').with(
        user: 'php',
        private_key_source: '/var/workspace/id_rsa'
      )
    end

    it 'will not try to config git' do
      expect(chef_run).to_not set_codenamephp_git_client_config_user('Set configs for php')
    end
  end

  context 'With custom users attributes' do
    override_attributes['users'] = %w(user1 user2)
    override_attributes['codenamephp']['workstation_php']['ssh_keys']['local_copy']['user1']['private_key_source'] = '/some/private/key'
    override_attributes['codenamephp']['workstation_php']['git_client']['user1']['config'] = { 'user.name' => 'User 1', 'user.email' => 'user1@test.de' }

    it 'includes git recipe' do
      expect(chef_run).to include_recipe('codenamephp_workstation_php::git')
    end

    it 'Creates all users' do
      expect(chef_run).to create_user('user1').with(
        group: 'php',
        manage_home: true
      )

      expect(chef_run).to create_user('user2').with(
        group: 'php',
        manage_home: true
      )
    end

    it 'copies the ssh key for user1 and not user2' do
      expect(chef_run).to install_codenamephp_ssh_keys_local_copy('Copy ssh keys for user1').with(
        user: 'user1',
        private_key_source: '/some/private/key'
      )

      expect(chef_run).to_not install_codenamephp_ssh_keys_local_copy('Copy ssh keys for user2')
    end

    it 'will config git for user1 but not user2' do
      expect(chef_run).to set_codenamephp_git_client_config_user('Set configs for user1').with(user: 'user1', configs: { 'user.name' => 'User 1', 'user.email' => 'user1@test.de' })
      expect(chef_run).to_not set_codenamephp_git_client_config_user('Set configs for user2')
    end
  end
end
