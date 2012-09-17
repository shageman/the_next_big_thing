module Teaser
  class Entry < ActiveRecord::Base
    attr_accessible :email
    validates :email, presence: true
  end
end