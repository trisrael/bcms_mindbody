require File.expand_path("../../spec_helper", __FILE__)

require 'mindbody'

describe StaffOptions, "#create" do
	before :each do
		@default_source_creds = {"source_name" => "DanceStudioOne", "password" => "Password", "site_ids" => "14543"}
		@default_vals = @default_source_creds.merge({:name => "Name"})
	end

	it "should error when no name supplied" do
		lambda{ 			
			StaffOptions.create!(@default_source_creds)
		}.should raise_error
		MindbodyOptions.all.should be_empty	
	end

	it "should error when missing source name" do
		lambda{ 			
			vals.delete("SourceName")
			StaffOptions.create!(vals)
		}.should raise_error
		MindbodyOptions.all.should be_empty	
	end	

	it "should error when missing site_ids" do
		lambda{ 				
			vals.delete("SiteIDs")
			StaffOptions.create!(vals)
		}.should raise_error
		MindbodyOptions.all.should be_empty	
	end	

	it "should have validation errors when site ids in wrong format" do
		
	end

	it "should error when missing password" do
		lambda{ 			
			vals.delete("Password")
			StaffOptions.create!(vals)
		}.should raise_error
		MindbodyOptions.all.should be_empty	
	end
	
	it "should get added to MindbodyOptions table when supplied with correct creation values" do
		opts = StaffOptions.create!(vals)
		MindbodyOptions.all.should have(1).things
	end

	private
	
	#Helpers
	
	def vals
		@default_vals
	end 	


	after :each do
		MindbodyOptions.delete_all
	end
end
