#Parent class for holding mindbody query options as they all come down to being simple 
class MindbodyOptions < ActiveRecord::Base
	acts_as_content_block :taggable => false, :renderable => false
	serialize :options, Hash	
	validates_presence_of :site_ids, :source_name, :password
	validates_format_of :sites_ids, :with => /\A(?:\s*\d+\s*\,)*\s*\d+\s*\z/, :on => :create	#Make sure it looks like this => 123, 232, 1 OR 123

	#Setup options with empty hash to be saved with SourceCredentials hash set for virtual attributes to set within
    before_validation(:on => :create) do
		self.options => {'SourceCredentials' => {}}
    end

	##############----->> Virtual Attributes

	#Getters
	
	def site_ids
		get_source_creds_attr 'SiteIds'
	end

	def source_name
		get_source_creds_attr 'SourceName'
	end

	def password
		get_source_creds_attr 'Password'
	end

	#Setters

	def site_ids=(ids_str)
		ids = ids.split(',')
		set_source_creds_attr 'SiteIDs', ids				
	end

	def source_name=(src_name)
		set_source_creds_attr 'SourceName', src_name		
	end

	def password=(pass)
		set_source_creds_attr 'Password', pass
	end
	
	private
	
	#Helpers

	def source_creds
		self.options['SourceCredentials']
	end

	def set_source_creds_attr(attr_name, value)
		source_creds[attr_name] = value
	end

	def get_source_creds_attr(attr_name)
		source_creds[attr_name] 
	end

end
