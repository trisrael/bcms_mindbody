class ParameterPartialAssociation < ActiveRecord::Base
	belongs_to :parameter_partials
	belongs_to :mindbody_portlet, :class_name => 'Portlet'
end
