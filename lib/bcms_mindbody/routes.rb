module Cms::Routes
  def routes_for_bcms_mindbody
    match "/staff/by_collection/:name", :to => "staff#using_portlet", :method => :get, :defaults => {:format=> 'json'}
    match "/staff.json", :to => "staff#index", :method => :get, :defaults => {:format=> 'json'}
	namespace :cms do
			#Add extra 's' due to usage of string#classify method
		    resources :mindbody_options
		    resources :staff_options
	end
  end
end
