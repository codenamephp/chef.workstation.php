# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Spec:: php
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

describe 'codenamephp_workstation_php::php' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds sury repository' do
      expect(chef_run).to add_codenamephp_php_sury_repository('sury-php')
    end

    it 'installs php7.4 and additional packages' do
      expect(chef_run).to install_codenamephp_php_package('install php')
    end

    it 'installs composer' do
      expect(chef_run).to install_codenamephp_php_composer('install composer')
    end

    it 'installs xdebug' do
      expect(chef_run).to install_codenamephp_php_xdebug('install xdebug').with(php_versions: %w[7.4])
    end

    it 'will install phive' do
      expect(chef_run).to install_codenamephp_php_phive('install phive')
    end
  end

  context 'With custom php packages' do
    override_attributes['codenamephp']['workstation_php']['php']['additional_packages'] = %w[package1 package2]

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs php7.4 and additional packages' do
      expect(chef_run).to install_codenamephp_php_package('install php').with(
        additional_packages: %w[package1 package2]
      )
    end
  end
end
