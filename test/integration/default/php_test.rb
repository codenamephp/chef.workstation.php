# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::php

describe docker_image('codenamephp/php.webdevops.php-dev:latest') do
  it { should exist }
end

describe docker_image('codenamephp/php.webdevops.php-dev:8.0') do
  it { should exist }
end
