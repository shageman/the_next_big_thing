require "spec_helper"

module Teaser
  describe Teaser::Entry do
    it { should validate_presence_of :email }
  end
end