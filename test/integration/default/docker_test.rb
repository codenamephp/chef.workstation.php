# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::docker

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe service('docker') do
  it { should be_installed }
  it { should be_running }
  it { should be_enabled }
end

describe command('docker-compose -v') do
  its('exit_status') { should eq 0 }
end
