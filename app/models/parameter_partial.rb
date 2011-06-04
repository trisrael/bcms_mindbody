#Parent class for holding mindbody query options as they all come down to being simple 
class ParameterPartial < ActiveRecord::Base
	acts_as_content_block :taggable => false, :renderable => false, :versioned => false
	serialize :options, Hash
	validates_presence_of :site_ids, :source_name, :password
	
	module Constants
		SiteIDs = 'SiteIds'
		SourceName = 'SourceName'
		Password = 'Password'	
		SrcCreds = 'SourceCredentials'
	end

	#Hack to allow for content_block to save correctly
	def skip_callbacks
	end

	##############----->> Virtual Attributes

	#Getters
	
	def site_ids
		get_source_creds_attr Constants::SiteIDs
	end

	def source_name
		get_source_creds_attr Constants::SourceName
	end

	def password
		get_source_creds_attr Constants::Password
	end

	#Setters

	def site_ids=(ids_str)
		ids = ids_str.split(/\s*,\s*/)
		int_ids = []
		begin
			ids.each do |id, ind|
				int_ids << id.to_i
			end
			set_source_creds_attr Constants::SiteIDs, int_ids		
		rescue	
			self.errors.add(:site_ids, 'invalid format for site id')
		end
	end

	def source_name=(src_name)
		set_source_creds_attr Constants::SourceName, src_name
	end

	def password=(pass)
		set_source_creds_attr Constants::Password, pass
	end
	
	private
	
	#Helpers

	def source_creds
		self.options = {Constants::SrcCreds => {}} unless self.options && self.options[Constants::SrcCreds]		
		#Setup options with empty hash to be saved with SourceCredentials hash set for virtual attributes to set within
		self.options[Constants::SrcCreds]
	end

	def set_source_creds_attr(attr_name, value)
		source_creds[attr_name] = value
	end

	def get_source_creds_attr(attr_name)
		source_creds[attr_name]
	end

end
