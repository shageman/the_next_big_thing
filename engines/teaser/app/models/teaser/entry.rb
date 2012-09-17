module Teaser
  class Entry < ActiveRecord::Base
    attr_accessible :email, :tries
    validates :email, presence: true
  end
end