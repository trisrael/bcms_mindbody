class AddJoinOptionsToPortlet < ActiveRecord::Migration
   def self.up
    create_table :parameter_partial_associations do |t|
      t.integer  :mindbody_portlet_id
      t.integer  :parameter_partial_id
    end

  end

  def self.down
    drop_table :parameter_partial_associations
  end
end
