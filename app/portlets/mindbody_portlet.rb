class MindbodyPortlet < Portlet
	has_many :mindbody_options_associations
	has_many :mindbody_options, :through => :mindbody_options_associations	
	accepts_nested_attributes_for :mindbody_options
end
