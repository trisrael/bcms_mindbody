class CreateMindbodyOptions < ActiveRecord::Migration

  def self.up
	create_content_table :mindbody_options, {:versioned => false} do |t|
      t.string :name
      t.string :type
      t.text :options, :size => (64.kilobytes + 1)
    end
	s = "Mindbody Parameters"
	ContentType.create!(:name => 'MindbodyOptions', :group_name => s)	
    CategoryType.create(:name => 'MindbodyOptions')
  end


  def self.down
	ContentType.delete_all(['name = ?', 'MindbodyOptions'])
	CategoryType.delete_all(['name = ?', 'MindbodyOptions'])
    drop_table :mindbody_options
  end

end
