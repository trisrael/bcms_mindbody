require File.expand_path("../../spec_helper", __FILE__)
require File.expand_path("../../staff_helper", __FILE__)

module StaffConstants
	Attributes = [:id, :bio, :image_url, :first_name, :last_name, :name]
end

describe StaffController do
	include StaffHelper

	before :each do
		mock_service
	end

	describe "#index" do

		it "has 200 code" do
			get :index, {:source_credentials => 1}
			response.code.should eq("200")
		end
	
		it "should fail to return failure when missing source creds" do
			get :index
			response.code.should eq("500")
		end

	end

end
