# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::php

describe package('php7.4-cli') do
  it { should be_installed }
end

describe command('php --version') do
  its('stdout') { should match(/PHP 7\.4/) }
end

describe command('php -i') do
  its('stdout') { should match(/xdebug support => enabled/) }
end

describe command('composer -v') do
  its('stdout') { should match(/Composer version \d+\.\d+(\.\d+)?(-\S*)?/) }
end

describe command('phive --version') do
  its('stdout') { should match(/Phive \d+\.\d+(\.\d+)?(-\S*)?/) }
end