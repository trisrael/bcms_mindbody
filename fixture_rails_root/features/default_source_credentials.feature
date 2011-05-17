Feature: Default Source Credentials
	As a site administrator when putting together multiple
	mindbody widgets it is likely that all of them will make use 
	of the same Mindbody site. A site administrator should be able to
	set this once and have SOAP requests have these source credentials used.
	
	@wip
	Scenario: Set default Source Credentials
		Given I am logged in as an admin
		And I go to the administration page
		I should see "Mindbody Settings"
		And I follow "Mindbody Settings"
		I should see "Default Source Credentials"
		I should see the inputs:
		|SourceName|
		|Password|
		|SiteIDs|
		I should see "Save Source Credentials"
