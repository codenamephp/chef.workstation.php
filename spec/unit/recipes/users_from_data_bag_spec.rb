# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Spec:: users_from_data_bag
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

describe 'codenamephp_workstation_php::users_from_data_bag' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates chef users from databag' do
      expect(chef_run).to create_codenamephp_users_from_data_bag('Create users').with(
        data_bag_name: 'users',
        groups: %w(php docker sudo sysadmin)
      )
    end

    it 'managers git users from data bag' do
      expect(chef_run).to include_recipe('codenamephp_workstation_php::git')

      expect(chef_run).to manage_codenamephp_git_client_config_users_from_data_bag('Manage git users')
    end
  end

  context 'With custom users attributes' do
    override_attributes['codenamephp']['workstation_php']['users_from_data_bag']['data_bag_name'] = 'some databag'
    override_attributes['codenamephp']['workstation_php']['users_from_data_bag']['groups'] = %w(some groups)

    it 'Creates all users' do
      expect(chef_run).to create_codenamephp_users_from_data_bag('Create users').with(
        data_bag_name: 'some databag',
        groups: %w(some groups)
      )
    end
  end
end
