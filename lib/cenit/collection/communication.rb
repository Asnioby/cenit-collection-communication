module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ communication build ]), File.dirname(__FILE__))
    require "cenit/client"

    @communication = Cenit::Collection::Communication::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @communication.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@communication.shared_collection.to_json, config)
    end

    def self.show_collection
      @communication.shared_collection
    end

    def self.pull_collection (parameters,config)
      @communication.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@communication.sample_model(model).to_json, config)
    end

    def self.import(data)
      @communication.import_data(data)
    end
  end
end