require "spec_helper"

module EmailSignup
  describe EmailSignup::Entry do
    it { should validate_presence_of :email }
  end
end