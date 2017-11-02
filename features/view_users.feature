Feature: View every user
As an admin
I want to have special settings
So that I can view users account

Scenario: An admin visit a private profile
Given the admin logged in
When I go to private profile
Then I should be able to view user account