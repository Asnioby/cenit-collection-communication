require "cenit/collection/communication/version"

module Cenit
  module Collection
    require "cenit/collection/communication/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/communication'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Communication.push_collection config
    # Cenit::Collection::Communication.shared_collection

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
      Cenit::Client.push(@communication.sample_data(model).to_json, config)
    end
  end
end