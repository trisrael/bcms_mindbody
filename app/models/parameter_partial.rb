#Parent class for holding mindbody query options as they all come down to being simple 
class ParameterPartial < ActiveRecord::Base
	acts_as_content_block :taggable => false, :renderable => false, :versioned => false
	serialize :options
	validates_presence_of :name

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
		source_creds.ids
	end

	def source_name
		source_creds.name
	end

	def password
		source_creds.password
	end

	#Setters

	def site_ids=(ids_str)

		ids = ids_str.split(/\s*,\s*/)
		int_ids = []
		begin
			ids.each do |id|
				int_s = id.to_i
				int_ids << int_s
				raise "Invalid id supplied" if int_s == 0
			end
			source_creds.ids= int_ids
		rescue	
			self.errors.add(:site_ids, 'invalid format for id')
		end

	end

	def source_name=(src_name)
		source_creds.name= src_name
	end

	def password=(pass)
		source_creds.password= pass
	end
	
	
	
	#Helpers

	def source_creds
		#Setup up a new object if not already setup
		self.options = Mb::SourceCredentials.new unless self.options
		#Setup options with empty hash to be saved with SourceCredentials hash set for virtual attributes to set within
		self.options
	end

end
