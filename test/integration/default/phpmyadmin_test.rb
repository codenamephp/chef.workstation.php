# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::phpmyadmin

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe http('localhost:8888') do
  its('status') { should eq 200 }
  its('body') { should match(/phpmyadmin/) }
end
