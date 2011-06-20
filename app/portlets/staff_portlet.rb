class StaffPortlet < Portlet
  has_many :parameter_partial_associations, :foreign_key => "mindbody_portlet_id"
  has_one :site_parameter_partial, :through => :parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial
  has_many :staff_parameter_partials, :through => :parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial

  validates_presence_of :site_parameter_partial_id, :message => "need to supply Source Credentials to authenticate with Mindbody Service"

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true
     
  def render
    @id = @portlet.name
  end
    
end
