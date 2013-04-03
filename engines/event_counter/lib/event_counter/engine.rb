module EventCounter
  class Engine < ::Rails::Engine
    isolate_namespace EventCounter

    initializer :append_migrations do |app|
      app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded unless app.root.to_s.match root.to_s
    end
  end
end
