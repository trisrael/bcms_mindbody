class ParameterPartialAssociation < ActiveRecord::Base
	belongs_to :parameter_partial
	belongs_to :staff_portlet, :class_name => 'Portlet'
end
