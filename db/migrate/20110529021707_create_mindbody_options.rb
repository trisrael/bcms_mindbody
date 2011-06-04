class CreateMindbodyOptions < ActiveRecord::Migration

  module Consts
  	Group = "Mindbody Parameters"
	Name = "MindbodyOptions"
  end

  def self.up
	create_content_table :mindbody_options, {:versioned => false} do |t|
      t.string :name
      t.string :type
      t.text :options, :size => (64.kilobytes + 1)
    end

	ContentType.create!(:name => Consts::Name, :group_name => Consts::Group)	    
  end


  def self.down
	ContentType.delete_all(['name = ?', Consts::Name])
	CategoryType.delete_all(['name = ?', Consts::Name])
    drop_table :mindbody_options
  end

end
