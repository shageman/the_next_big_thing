module Teaser
  class Engine < ::Rails::Engine
    isolate_namespace Teaser

    config.paths['db/migrate'] << File.join(Teaser::Engine.paths['db/migrate'].first)
  end
end
