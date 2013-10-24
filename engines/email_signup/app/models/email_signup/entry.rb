module EmailSignup
  class Entry < ActiveRecord::Base
    # attr_accessible :email, :tries
    validates :email, presence: true, uniqueness: true
  end
end