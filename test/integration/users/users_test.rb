# frozen_string_literal: true

# InSpec test for recipe codenamephp_workstation_chef::users

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('php') do
  it { should exist }
  its('group') { should eq 'php' }
  its('home') { should eq '/home/php' }
end

describe file('/home/php/.ssh/id_rsa') do
  it { should exist }
  it { should be_file }
  its('content') { should eq 'my private key' }
  its('group') { should eq 'php' }
  its('owner') { should eq 'php' }
  its('mode') { should cmp '0600' }
end

describe file('/home/php/.ssh/id_rsa.pub') do
  it { should exist }
  it { should be_file }
  its('content') { should eq 'my public key' }
  its('group') { should eq 'php' }
  its('owner') { should eq 'php' }
  its('mode') { should cmp '0640' }
end

describe command('sudo -u php git config --global user.name') do
  its('stdout.strip') { should eq('I am php') }
end

describe command('sudo -u php git config --global user.email') do
  its('stdout.strip') { should eq('php@test.de') }
end
