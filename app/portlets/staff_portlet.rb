class StaffPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true
     
  def render
    @id = @portlet.name
  end
    
end
