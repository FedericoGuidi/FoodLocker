Feature: Demoting users
As an admin
I want to have special settings
So that I can demote users

Scenario: An admin demote an user
Given the admin logged in
When I go to personal profile
Then I should be able to demote users
