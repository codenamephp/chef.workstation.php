# frozen_string_literal: true

name 'codenamephp_workstation_php'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Cookbook to install apache2'
version '2.4.1'
chef_version '>= 15.3'
issues_url 'https://github.com/codenamephp/chef.workstation.php/issues'
source_url 'https://github.com/codenamephp/chef.workstation.php'

supports 'debian'

depends 'codenamephp_jetbrains_toolbox', '~> 1.0'
depends 'codenamephp_docker', '~> 3.0'
depends 'codenamephp_edge', '~> 1.0'
depends 'codenamephp_git_client', '~> 1.0'
depends 'codenamephp_gnome', '~> 1.0'
depends 'codenamephp_keyboard_layout', '~> 1.0'
depends 'codenamephp_ssh_keys', '~> 1.0'
depends 'codenamephp_users', '~> 1.0'
