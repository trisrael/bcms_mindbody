class StaffController < ActionController::Base
  def index
	@staff = Staff.all(params)
	respond_to do |format|
 		format.html #index.html.erb
		format.json { render :json => @staff }	
	end
  end

  def using_portlet
	@portlet = StaffPortlet.find_by_name(params.name)
	if @portlet
		@staff = Staff.all translate_options(@portlet.options)

		respond_to do |format|
			format.html #index.html.erb
			format.json { render :json => @staff }
		end	
	end
  end

  private
  
  #Takes a list of options held within a Staff Portlet and translates
  #them into understand options for the Mindbody API
  def translate_options(raw_portlet_mindbody_options)
    raw_portlet_mindbody_options
  end
 

end
