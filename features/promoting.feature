Feature: Promoting users
As an admin
I want to have special settings
So that I can promote users

Scenario: An admin promote an user to admin
Given the admin logged in
When I go to personal profile
Then I should be able to promote users
