# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_php
# Recipe:: users
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

include_recipe '::git'

group 'php'

node['users'].each do |username|
  user username do
    group 'php'
    manage_home true
    shell '/bin/bash'
  end

  codenamephp_ssh_keys_local_copy "Copy ssh keys for #{username}" do
    user username
    private_key_source node.dig(:codenamephp, :workstation_php, :ssh_keys, :local_copy, username, :private_key_source)
    only_if { node.dig(:codenamephp, :workstation_php, :ssh_keys, :local_copy, username, :private_key_source).is_a? String }
  end

  codenamephp_git_client_config_user "Set configs for #{username}" do
    user username
    configs lazy { node.dig(:codenamephp, :workstation_php, :git_client, username, :config) || {} }
    only_if do
      configs = node.dig(:codenamephp, :workstation_php, :git_client, username, :config)
      configs.is_a?(Hash) && !configs.empty?
    end
  end
end
