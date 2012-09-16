module Teaser
  class Entry < ActiveRecord::Base
    validates :email, presence: true
  end
end