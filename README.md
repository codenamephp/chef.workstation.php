# Chef Workstation PHP
![CI](https://github.com/codenamephp/chef.workstation.php/workflows/CI/badge.svg)

Sets up a PHP workstation for PHP development with docker and PHPStorm.

## Usage

Intended use is in a wrapper cookbook where you can either include the default recipe or just the recipe parts. You will have to create
users yourself.

## What's included

The workstation is based on git and docker and also installs some other useful tools:

- Sets german keyboard layout, utf-8 de locale and timezone to Europe/Berlin
- Docker, Docker-Compose and Docker image using codenamephp/php.webdevops.php-dev
- Git
- Jetbrains Toolbox for easy PHPStorm install
- MS Edge as browser

Optional:
- Install gnome gui and set keyboard shortcuts

## Attributes
- `default['users']`: This is used for a lot of different things, defaults to `['php']`
  - If you include the optional users recipe these users will be created and added to the ühp group
  - If the gnome recipe is included it is used to setup keyboard shortcuts

### users_from_data_bag

Used in the optional users_from_data_bag recipe:
- `default['codenamephp']['workstation_php']['users_from_data_bag']['data_bag_name']`: The name of the databag to get the users from, defaults to `'users'`
- `default['codenamephp']['workstation_php']['users_from_data_bag']['groups']`: The groups to find the users that will be managed. Defaults to `%w(php docker sudo sysadmin)`

### users
Used in the optional users cookbook:

The recipe checks for a specific path within the attributes that corresponds to the values of `default['users']` to copy ssh keys and manage git configs.
There is a default set for the default 'chef' user:

- `default['codenamephp']['workstation_php']['ssh_keys']['local_copy']['php']['private_key_source']`: `'/var/workspace/id_rsa'`
- `default['codenamephp']['workstation_php']['git_client']['php']['config'] = {}`

## Recipes

These are the recipes that are not included in the default recipe and can be used to "customize" the chef run.
The default recipe sets up everything else by including the recipes not listed here. Most notably, users and gui are optional.

### Gnome
Installs the gnome desktop and sets serveral settings and keyboard shortcuts

### Creating users
There are several ways to create users. These should be included before the default recipe so the users are already set up when the other tools are installed.
If you don't use one of those recipes make sure to create the users yourself since you might run into problems when the recipes try to setup tools that are bound to a user (like vscode)

#### Users
The users recipe is very very simple user setup. It just creates all users in the `default['users']` attribute with a home directory and an empty password and add them to the chef group.

It checks for a specific path within the attributes that corresponds to the values of `default['users']` to copy ssh keys.
There is a default set for the default 'php' user:

- `default['codenamephp']['workstation_php']['ssh_keys']['local_copy']['php']['private_key_source']`: `'/var/workspace/id_rsa'`

You can change this value or add additional attributes for additional users. If you need anything more sophisticated you should provide your own logic in a wrapper cookbook.

It also manages the git config for the set users. By default it's empty but you can set this the same way as attributes:

- `default['codenamephp']['workstation_php']['git_client']['php']['config'] = {}`

#### Users From Data Bag
A more sophisticated method of creating users. It looks for a databag with the name in `default['codenamephp']['workstation_php']['users_from_data_bag']['data_bag_name']`
and adds all users that have one the groups from `default['codenamephp']['workstation_php']['users_from_data_bag']['groups']`.

Note that the `default['users']` attribute is still important since this is used to setup things like gnome keyboard shortcuts The databag is just for the
creation of the users so yous hould try to match them (for now).

Also any users according to the [codenamephp_git_client_config_users_from_data_bag resource][codenamephp_git_client_config_users_from_data_bag_url] are managed as well.

[user_cookbook_url]: https://supermarket.chef.io/cookbooks/user
[codenamephp_git_client_config_users_from_data_bag_url]: https://github.com/codenamephp/chef.cookbook.gitClient#config_users_from_data_bag
