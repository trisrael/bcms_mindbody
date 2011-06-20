##
# All methods from this helper will be available in the render.html.erb for PhotoGalleryPortlet
module StaffPortletHelper

	#Simple helpers for giving HTML id's for multiple radio buttons and checkboxes
	def checkbox_id(id)
		"checkbox_" + id
	end
	
	def radio_id(id)
		"radio_" + id
	ebd
  
end
