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

### Users
 There is the `default['users'] = []` attribute that is used by different resources e.g. for setting keyboard shortcuts etc. The purpose for this is to have
 multiple resources to configure the users the same way. You don't have to set this but it provides an easy way to just set an attribute and have users configured
 without addtional cookbooks.
