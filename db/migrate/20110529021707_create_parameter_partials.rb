class CreateParameterPartials < ActiveRecord::Migration

  module Consts
  	Group = "Mindbody Parameters"
	Name = "ParameterPartial"
  end

  def self.up
	create_content_table :parameter_partials, {:versioned => false, :publishable => false, :renderable => false} do |t|
      t.string :name
      t.string :type
      t.text :options, :size => (64.kilobytes + 1)
    end

	Cms::ContentType.create!(:name => Consts::Name, :group_name => Consts::Group)	    
  end


  def self.down
	Cms::ContentType.delete_all(['name = ?', Consts::Name])
	CategoryType.delete_all(['name = ?', Consts::Name])
    drop_table :parameter_partials
  end

end
