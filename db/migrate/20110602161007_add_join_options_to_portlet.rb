class AddJoinOptionsToPortlet < ActiveRecord::Migration
   def self.up
    create_table :mindbody_options_associations do |t|
      t.integer  :mindbody_portlet_id
      t.integer  :mindbody_options_id
    end

  end

  def self.down
    drop_table :mindbody_options_associations
  end
end
