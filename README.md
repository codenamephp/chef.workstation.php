# Chef Workstation PHP
[![Build Status](https://travis-ci.com/codenamephp/chef.workstation.php.svg?branch=master)](https://travis-ci.com/codenamephp/chef.workstation.php)

Sets up a PHP workstation including PHPStorm, configs, apache2, ...

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.0+

### Cookbook Depdendencies

## Usage

Add the cookbook to your Berksfile:

```
cookbook 'codenamephp_workstation_php'
```

Add the cookbook to your runlist, e.g. in a role:


```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[codenamephp_workstation_php]"
  ]
}
```

## PHP and Apache
When PHP is installed, php-fpm is added automatically and the service is started. Therefore, Apache is installed with mpm_event.