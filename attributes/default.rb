default['users'] = ['php']
default['codenamephp']['workstation_php']['users_from_data_bag']['data_bag_name'] = 'users'
default['codenamephp']['workstation_php']['users_from_data_bag']['groups'] = %w(php docker sudo sysadmin)
default['codenamephp']['workstation_php']['ssh_keys']['local_copy']['php']['private_key_source'] = '/var/workspace/id_rsa'
default['codenamephp']['workstation_php']['git_client']['php']['config'] = {}
