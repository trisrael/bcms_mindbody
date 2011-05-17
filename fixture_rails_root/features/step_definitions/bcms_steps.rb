Given /^a content administrator named "([^"]*)" with password "([^"]*)"$/ do |name, pw|
	person = User.new(:password => pw, :password_confirmation => pw, :login => name, :email => name + "@gmail.com")
	person.save!
	group = Group.find_by_code("cms-admin")
	raise "Error while creating user: #{name}" if !person || !group
	user_group = UserGroupMembership.new(:user_id => person.id, :group_id => group.id)
	user_group.save!
end

Then /^a user named "([^"]*)" should exist with cms access$/ do |name|
	user = User.find_by_login(name)
	user.should_not be_nil
 	(user.groups.cms_access.length > 0).should be true
end

When /^I login as admin$/ do
	  steps %Q{
		When I go to the cms login page
		And I fill in the following:
		| login | cmsadmin |
		| password | cmsadmin |
		And I press "LOGIN"
	}
end
