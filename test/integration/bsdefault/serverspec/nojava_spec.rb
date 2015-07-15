require 'spec_helper'

describe command('ls /usr/bin/java') do
  its(:exit_status) { should_not eq 0 }
end
