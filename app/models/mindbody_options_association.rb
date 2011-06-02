class MindbodyOptionsAssociation < ActiveRecord::Base
	belongs_to :mindbody_options
	belongs_to :mindbody_portlet, :class_name => 'Portlet'
end
