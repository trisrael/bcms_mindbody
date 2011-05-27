#Parent class for holding mindbody query options as they all come down to being simple 
class MindbodyOptions < ActiveRecord::Base
	acts_as_content_block :taggable => false, :renderable => false
	serialize :options, Hash
end
