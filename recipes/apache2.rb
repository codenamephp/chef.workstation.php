# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Recipe:: apache2
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

# service['apache2'] is defined in the apache2_default_install resource but other resources are currently unable to reference it.
# To work around this issue, define the following helper in your cookbook:
service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name } # rubocop:disable Lint/AmbiguousBlockAssociation
  supports restart: true, status: true, reload: true
  action :nothing
end

apache2_module 'php7.4' do
  action :disable
end

apache2_install 'default_install' do
  mpm 'event'
end

node['codenamephp']['workstation_php']['apache2']['modules'].each do |module_name|
  apache2_module module_name
end

# Create site template with our custom config
site_name = 'default_ssl'

template site_name do
  extend Apache2::Cookbook::Helpers
  source 'default_ssl.conf.erb'
  path "#{apache_dir}/sites-available/#{site_name}.conf"
end

apache2_site site_name
