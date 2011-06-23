require File.expand_path("../../spec_helper", __FILE__)
require File.expand_path("../../soap_helper", __FILE__)

require 'mindbody'

module StaffConstants
	Attributes = [:id, :bio, :image_url, :first_name, :last_name, :name]
end

describe StaffController do
	before :each do
		mock_staff_service		
		get :index
	end

	describe "#index" do
		it "has 200 code" do
			response.code.should eq("200")
		end
	
		it "should return properly formatted json response of staff members" do
			raise response.body.to_inspect
		end
	end
		
	private

	def mock_staff_service
		staff_service = mock "MBStaffService" #Mock the instance to be created
		staff_service.should_receive(:get_staff).and_return(SoapHelper.single_staff_response)
		Mb::StaffService.stub!(:new).and_return(staff_service)
	end
end
