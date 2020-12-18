# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::php

describe package('php7.4-cli') do
  it { should be_installed }
end

describe package('php7.4-fpm') do
  it { should be_installed }
end

describe service('php7.4-fpm') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('php --version') do
  its('stdout') { should match(/PHP 7\.4/) }
end

describe command('php -i') do
  its('stdout') { should match(/Development Aids =>.*enabled/) }
  its('stdout') { should match(/Step Debugger =>.*disabled/) }
end

describe command('composer -v') do
  its('stdout') { should match(/Composer version \d+\.\d+(\.\d+)?(-\S*)?/) }
end

describe command('phive --version') do
  its('stdout') { should match(/Phive \d+\.\d+(\.\d+)?(-\S*)?/) }
end
