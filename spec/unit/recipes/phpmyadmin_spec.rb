# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Spec:: phpmyadmin
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

describe 'codenamephp_workstation_php::phpmyadmin' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'sets up docker' do
      expect(chef_run).to include_recipe('codenamephp_docker::service')
    end

    it 'pulls the phpmyadmin image' do
      expect(chef_run).to pull_docker_image('phpmyadmin').with(repo: 'phpmyadmin/phpmyadmin')
    end

    it 'runs the phpmyadmin container' do
      expect(chef_run).to run_docker_container('phpmyadmin').with(
        repo: 'phpmyadmin/phpmyadmin',
        port: '8888:80',
        env: ['PMA_HOST=172.17.0.1'],
        restart_policy: 'always'
      )
    end
  end
end
