require 'browsercms'

module BcmsMindbody
  class Engine < Rails::Engine
    include Cms::Module
  end
end
