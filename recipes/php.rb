# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Recipe:: php
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

codenamephp_php_sury_repository 'sury-php'

codenamephp_php_package 'install php' do
  package_name 'php7.4-cli'
  additional_packages node['codenamephp']['workstation_php']['php']['additional_packages']
end

codenamephp_php_composer 'install composer'

codenamephp_php_xdebug 'install xdebug' do
  php_versions %w[7.4]
end

codenamephp_php_phive 'install phive'
