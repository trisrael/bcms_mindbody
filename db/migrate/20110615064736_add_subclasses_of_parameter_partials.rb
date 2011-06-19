class AddSubclassesOfParameterPartials < ActiveRecord::Migration

  module Consts
  	Group = "Mindbody Parameters"
	Site = "SiteParameterPartial"
	Staff = "StaffParameterPartial"
  end

  def self.up
  	Cms::ContentType.create!(:name => Consts::Site, :group_name => Consts::Group)
	Cms::ContentType.create!(:name => Consts::Staff, :group_name => Consts::Group)	    	    
  end

  def self.down
	Cms::ContentType.delete_all(['name = ?', Consts::Site])
	CategoryType.delete_all(['name = ?', Consts::Site])
	Cms::ContentType.delete_all(['name = ?', Consts::Staff])
	CategoryType.delete_all(['name = ?', Consts::Staff])
  end

end
