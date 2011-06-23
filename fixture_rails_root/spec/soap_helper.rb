class MBSuccessXml < Savon::SOAP::XML
	
	#Specialized type of return type shadowing what mindbody succesful resul
	def to_xml 
		@xml ||= tag(builder, :Envelope, complete_namespaces) do |xml|
			tag(xml, :Body) { xml << success_body_to_xml}
		end
	end	

      # Returns the SOAP body as an XML String.
	def success_body_to_xml
       return body.to_s unless body.kind_of? Hash
		puts namespace_identifier
		puts element_form_default
       Gyoku.xml body, :element_form_default => element_form_default, :namespace => namespace_identifier
    end

end

class SoapHelper

	def self.single_staff_response
	
		body = { "GetStaffResponse" => { "GetStaffResult" => {
							"Status" => "Success", 
							"XMLDetail" => "Full",
							"ResultCount" => 26,
							"CurrentPageIndex" => 1,
							"TotalPageCount" => 3,
							"StaffMembers" => { "Staff" => 
									[ 
										{"ID" => 1232, "Name" => "Kenny Mugisha", "FirstName" => "Kenny", "LastName" =>"Mugisha", "ImageURL" => "/kenny.jpg",  "Bio" => "Kenny has been bboying for the last 9 years..."}
									 ] 
							}
		    			}
					}
		       }

		xml =  MBSuccessXml.new(Mb::StaffService.service("StaffService"), nil, body);
		xml.namespaces = {"xmlns:_5" => "http://clients.mindbodyonline.com/api/0_5", "xmlns:env" => "http://schemas.xmlsoap.org/soap/envelope/"}
		xml.namespace_identifier = "_5"
		xml.element_form_default = :qualified
		raw_response = xml.to_xml

		httpi = HTTPI::Response.new(200, {"Cache-Control"=>"private, max-age=0", "Content-Type"=>"text/xml; charset=utf-8", "Server"=>"Microsoft-IIS/7.5", "X-AspNet-Version"=>"2.0.50727", "X-Powered-By"=>"ASP.NET", "P3P"=>"CAO DSP COR CUR TAIa OUR NOR UNI STA", "Date"=>"Fri, 13 May 2011 02:39:05 GMT", "Content-Length"=> "#{raw_response.bytesize}"}, raw_response )

		Savon::SOAP::Response.new httpi
	end

end
