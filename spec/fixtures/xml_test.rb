	xml =  Savon::SOAP::XML.new
	    xml.body = { "GetStaffResponse" => { "GetStaffResult" => {
							"Status" => "Success", 
							"XMLDetail" => "Full",
							"ResultCount" => 26,
							"CurrentPageIndex" => 1,
							"TotalPageCount" => 3,
							"StaffMembers" => { "Staff" => 
									[ 
										{"ID" => 1232, "Name" => "Kenny Mugisha", "FirstName" => "Kenny", "LastName" =>"Mugisha", "ImageURL" => "/kenny.jpeg",  "Bio" => "Kenny has been bboying for the last 9 years..."}
									 ] 
							}
		    			}
					}
		       }
