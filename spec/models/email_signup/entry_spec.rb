require "spec_helper"

describe EmailSignup::Entry do
  it { should validate_presence_of :email }
end
