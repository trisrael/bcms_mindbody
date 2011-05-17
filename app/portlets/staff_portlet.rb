class StaffPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true
     
  def render
    per_page = @portlet.per_page.to_i > 0 ? @portlet.per_page.to_i : 10
    @staff = Staff.all(@portlets.options).paginate(:per_page => per_page, :page => 0)
  end
    
end
