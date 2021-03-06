Feature: Show faculty members
	In order to want to take a class
	sometimes a potential User would like
	to see who is teaching and what their accomplishments 
	are. 

	Scenario: View Staff Portlet form
		When I login as admin
		And I go to the content library
		And I follow "Portlet"
		And I follow "Add new Content"
		And I follow "Staff Portlet"
		Then I should see inputs
		|SourceCredentials|
		|StaffIDs|
		And I should see a label "Staff Types"
		And I should see check boxes
		|Instructors|
		|Past-Instructors|
		|Appointment|
		|Other|
		And I should see a label "Fields to display"
		And I should see check boxes
		|Image|
		|Bio|
		|Name|
		|Id|
		And there should be submit buttons
