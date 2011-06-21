class StaffPortlet < Portlet
  has_many :staff_parameter_partial_associations, :foreign_key => "mindbody_portlet_id"
  has_many :site_parameter_partial_associations, :foreign_key => "mindbody_portlet_id"
  has_many :site_parameter_partials, :through => :site_parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial, :limit => 1, :before_add => :delete_others
  has_many :staff_parameter_partials, :through => :staff_parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial

  before_save :ensure_more_than_one
	
  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @id = @portlet.name
  end

  def site_parameter_partial=(sp)	
	self.site_parameter_partials= [sp]
  end

  def site_parameter_partial
	self.site_parameter_partials ? self.site_parameter_partials.first : nil
  end
  
  private 

  def delete_others
	#A bit wasteful but gets the job done
    self.site_parameter_partials.delete_all
  end

  def ensure_more_than_one
    arr = site_parameter_partials
    unless arr && arr.first != nil && arr.size < 1
		errors.add :source_credentials, "are needed in order to talk to Mindbody service"
	end
  end
    
end
