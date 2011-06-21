module Cms::Routes
  def routes_for_bcms_mindbody

    match '/staff', :to => 'staff#index', :as => 'staff', :method => :get, :defaults => {:format=> 'json'}

	namespace :cms do		
		    content_blocks :parameter_partials
		    content_blocks :site_parameter_partials
		    content_blocks :staff_parameter_partials
	end

  end
end
