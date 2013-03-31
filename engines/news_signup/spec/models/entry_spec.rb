require "spec_helper"

module NewsSignup
  describe NewsSignup::Entry do
    it { should validate_presence_of :email }
  end
end