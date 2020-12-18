# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::apache2

describe service('apache2') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe apache_conf do
  its('Listen') { should eq %w(80 443) }
end

describe http('http://localhost') do
  its('status') { should cmp 200 }
end
describe http('https://localhost:443', ssl_verify: false) do
  its('status') { should cmp 200 }
end

describe command('apachectl -M') do
  its('stdout') { should match(/headers/) }
  its('stdout') { should match(/deflate/) }
  its('stdout') { should match(/ssl/) }
  its('stdout') { should match(/mpm_event/) }
end
