class MindbodyPortlet < Portlet
	has_many :parameter_partial_associations
	has_many :parameter_partials, :through => :parameter_partial_associations
	accepts_nested_attributes_for :parameter_partials
end
