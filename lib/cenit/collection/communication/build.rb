require 'cenit/collection/communication/version'
require 'cenit/collection/base/build'

module Cenit
  module Collection
    module Communication
      class Build < Cenit::Collection::Base::Build
        def initialize
          super(__dir__)
        end
      end
    end
  end
end