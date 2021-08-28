include_recipe '::git'

codenamephp_users_from_data_bag 'Create users' do
  data_bag_name node.dig(:codenamephp, :workstation_php, :users_from_data_bag, :data_bag_name)
  groups node.dig(:codenamephp, :workstation_php, :users_from_data_bag, :groups)
  only_if do
    groups = node.dig(:codenamephp, :workstation_php, :users_from_data_bag, :groups)
    node.dig(:codenamephp, :workstation_php, :users_from_data_bag, :data_bag_name).is_a?(String) && groups.is_a?(::Array) && !groups.empty?
  end
end

codenamephp_git_client_config_users_from_data_bag 'Manage git users'
