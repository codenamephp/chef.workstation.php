# Chef Workstation PHP
![CI](https://github.com/codenamephp/chef.workstation.php/workflows/CI/badge.svg)

Sets up a PHP workstation for PHP development with docker and PHPStorm.

## Requirements

### Supported Platforms

- Debian Buster

### Chef

- Chef 15.3+

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
