class AddSubclassesOfParameterPartials < ActiveRecord::Migration


  def self.up
  	Cms::ContentType.create!(:name => Consts::Name, :group_name => Consts::Group)
	Cms::ContentType.create!(:name => Consts::Name, :group_name => Consts::Group)	    	    
  end

  def self.down
  end
end
