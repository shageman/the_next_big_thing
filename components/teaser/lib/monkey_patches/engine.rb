module Rails
  class Engine < Railtie
    def load_seed
      seed_files = paths["db/seeds"]
      seed_files.each do |seed_file|
        load(seed_file)
      end
    end
  end
end
