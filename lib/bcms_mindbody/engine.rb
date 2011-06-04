require 'browsercms'

module BcmsMindbody
  class Engine < Rails::Engine
    include Cms::Module

   initializer :bcms_mindbody_inflections, :after =>	:load_config_initializers do 
		ActiveSupport::Inflector.inflections do |inflect|
		   inflect.uncountable 'MindbodyOptions'
		   inflect.uncountable 'mindbody_options'	
		   inflect.uncountable 'staff_options'
		   inflect.uncountable 'StaffOptions'
		end
	end
  end
end
