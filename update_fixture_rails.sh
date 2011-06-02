#!/bin/bash          
	echo "Building bcms_mindbody"
	gem build bcms_mindbody.gemspec
	if [ -f ./bcms_mindbody-1.0.0.gem ]	
		then 
		echo "Uninstalling bcms_mindbody gem"
		gem uninstall bcms_mindbody
        	echo "Installing newly created gem"
		gem install ./bcms_mindbody-1.0.0.gem
	fi

	if [ -d ./fixture_rails_root ]
		then
		echo "Adding bcms_mindbody module to dummy app"
		cd ./fixture_rails_root
		rails g cms:install bcms_mindbody
		rails generate bcms_mindbody:install			
		#rails s	
		cd ..
	fi
