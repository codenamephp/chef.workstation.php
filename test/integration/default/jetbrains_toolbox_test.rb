# frozen_string_literal: true

# InSpec test for recipe chef.workstation.php::jetbrains_toolbox

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe file('/usr/share/jetbrains-toolbox/app') do
  it { should exist }
end
