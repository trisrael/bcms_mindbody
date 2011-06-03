class CreateMindbodyOptions < ActiveRecord::Migration

  def self.up
	create_content_table :mindbody_options, {:versioned => false} do |t|
      t.string :name
      t.string :type
      t.text :options, :size => (64.kilobytes + 1)
    end
	s = "Mindbody Parameters"
	ContentType.create!(:name => 'Miscellaneous', :group_name => s)	
    CategoryType.create(:name => s)
  end


  def self.down
	ContentType.delete_all(['name = ?', 'Miscellaneous'])
    drop_table :mindbody_options
  end

end
