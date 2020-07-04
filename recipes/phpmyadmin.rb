# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Recipe:: phpmyadmin
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

docker_image 'phpmyadmin' do
  repo 'phpmyadmin/phpmyadmin'
end

docker_container 'phpmyadmin' do
  repo 'phpmyadmin/phpmyadmin'
  port '8888:80'
  env 'PMA_HOST=172.17.0.1'
  restart_policy 'always'
end
