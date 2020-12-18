# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Spec:: apache2
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

describe 'codenamephp_workstation_php::apache2' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs apache2' do
      expect(chef_run).to install_apache2_install('default_install').with(mpm: 'event')
    end

    it 'installs the ssl site template' do
      expect(chef_run).to create_template('default_ssl')
    end

    it 'activates the default ssl site' do
      expect(chef_run).to enable_apache2_site('default_ssl')
    end
  end

  context 'With custom modules' do
    override_attributes['codenamephp']['workstation_php']['apache2']['modules'] = %w(mod1 mod2)

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs the modules' do
      expect(chef_run).to enable_apache2_module('mod1')
      expect(chef_run).to enable_apache2_module('mod2')
    end
  end
end
