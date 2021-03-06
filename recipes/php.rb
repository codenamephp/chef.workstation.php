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

include_recipe '::docker'

docker_image 'php-dev' do
  repo 'codenamephp/php.webdevops.php-dev'
  retries 5
end

docker_image 'php-dev:8.0' do
  repo 'codenamephp/php.webdevops.php-dev'
  tag '8.0'
  retries 5
end
