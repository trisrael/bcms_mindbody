class MindbodyOptions < ActiveRecord::Migration

  def self.up
    
	create_versioned_table :mindbody_options do |t|
      t.string :name
      t.string :type
      t.text :options, :size => (64.kilobytes + 1)
    end
    
  end

  def self.down
    drop_table :mindbody_options_versions
    drop_table :mindbody_options_releases
  end

end
