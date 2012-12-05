Feature: Admin can manually add student

Scenario: Add a student
  Given I am on the FriedCheckin home page
  When I follow "Add new student"
  Then I should be on the Create New Student page
  When I fill in "Name" with "Kevin"
  And I fill in "Grade" with "15"
  And I press "Save Changes"
  Then I should be on the FriedCheckin home page
  And I should see "Kevin"
