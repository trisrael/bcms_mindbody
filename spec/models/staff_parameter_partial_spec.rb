require File.expand_path("../../spec_helper", __FILE__)

require 'mindbody'

describe StaffParameterPartial, "#create" do
	module Consts
		Src = "source_name"
		Pass = "password"
		SiteIds ="site_ids"
	end

	before :each do
		@default_source_creds = {Consts::Src => "DanceStudioOne", Consts::Pass => "Password", Consts::SiteIds => "14543"}
		@default_vals = @default_source_creds.merge({:name => "Name"})
	end

	it "should error when no name supplied" do
		lambda{ 			
			StaffParameterPartial.create!(@default_source_creds)
		}.should raise_error
		ParameterPartial.all.should be_empty	
	end

	it "should error when missing source name" do
		lambda{ 			
			vals.delete(Consts::Src)
			StaffParameterPartial.create!(vals)
		}.should raise_error
		ParameterPartial.all.should be_empty	
	end	

	it "should error when missing site_ids" do
		lambda{ 				
			vals.delete(Consts::SiteIds)
			StaffParameterPartial.create!(vals)
		}.should raise_error
		ParameterPartial.all.should be_empty	
	end	

	it "should have validation errors when site ids in wrong format" do
		@default_source_creds[Consts::SiteIds] = "14534, blah"
		par = StaffParameterPartial.new(@default_source_creds)
		par.valid?.should be_false
	end

	it "should error when missing password" do
		lambda{ 			
			vals.delete(Consts::Pass)
			StaffParameterPartial.create!(vals)
		}.should raise_error
		ParameterPartial.all.should be_empty	
	end
	
	it "should get added to MindbodyOptions table when supplied with correct creation values" do
		opts = StaffParameterPartial.create!(vals)
		ParameterPartial.all.should have(1).things
	end

	private
	
	#Helpers
	
	def vals
		@default_vals
	end

	after :each do
		ParameterPartial.delete_all
	end
end
