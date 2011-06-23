require File.expand_path("../../spec_helper", __FILE__)
require File.expand_path("../../staff_helper", __FILE__)

module StaffConstants
	Attributes = [:id, :bio, :image_url, :first_name, :last_name, :name]
end

describe Staff, "#all" do
	include StaffHelper

	before :all do
		@default_source_creds = {"SourceName" => "DanceStudioOne", "Password" => "Password", "SiteIDs" => [14543]}
	end

	it "throws an error with no source credentials or other parameters" do
		lambda { Staff.all }.should raise_error
	end

	it "creates staff members after receiving successful SOAP response" do
		mock_service

		staff_members = Staff.all(:source_credentials => 1)
		staff_members.should_not be_empty
		staff_members.each do |mem|
			mem.should be_an_instance_of Staff
			StaffConstants::Attributes.each {|attr|	mem.send(attr).should_not be_nil}
		end
	end

end
