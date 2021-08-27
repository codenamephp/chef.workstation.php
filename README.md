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
