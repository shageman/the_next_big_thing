if defined?(Rails)
  require 'annoyance/engine'
else
  require_relative '../app/models/annoyance/levels'
  require_relative '../app/models/annoyance/meter'
end

module Annoyance
end
