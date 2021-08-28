# frozen_string_literal: true

# InSpec test for recipe codenamephp_workstation_chef::users_from_data_bag

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('user1') do
  it { should exist }
  its('groups') { should include 'php' }
  its('groups') { should include 'docker' }
  its('groups') { should include 'sudo' }
  its('groups') { should include 'sysadmin' }
end

describe user('user2') do
  it { should_not exist }
end

describe user('user3') do
  it { should exist }
  its('groups') { should include 'php' }
end

describe command('sudo -u user1 git config --global user.name') do
  its('stdout.strip') { should eq('User 1') }
end

describe command('sudo -u user1 git config --global user.email') do
  its('stdout.strip') { should eq('user1@test.de') }
end

describe command('sudo -u user3 git config --global user.name') do
  its('stdout.strip') { should eq('User 3') }
end

describe command('sudo -u user3 git config --global user.email') do
  its('stdout.strip') { should eq('user3@test.de') }
end
