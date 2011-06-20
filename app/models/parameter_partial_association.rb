class ParameterPartialAssociation < ActiveRecord::Base
	belongs_to :parameter_partials
	belongs_to :staff_portlet, :class_name => 'Portlet'
end
