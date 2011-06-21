class StaffPortlet < Portlet
  has_many :staff_parameter_partial_associations, :foreign_key => "mindbody_portlet_id"
  has_many :site_parameter_partial_associations, :foreign_key => "mindbody_portlet_id"
  has_many :site_parameter_partials, :through => :site_parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial, :limit => 1, :before_add => :delete_others
  has_many :staff_parameter_partials, :through => :staff_parameter_partial_associations, :foreign_key => "mindbody_portlet_id", :source => :parameter_partial

  validates_presence_of :site_parameter_partial, :message => "need to supply Source Credentials to authenticate with Mindbody Service"
	
  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true

  def attributes=(params)
	super(params)
	raise params.inspect.to_s
  end
     
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
    
end
