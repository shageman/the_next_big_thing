require "spec_helper"

module EmailSignup
  describe EmailSignup::Entry do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end
end