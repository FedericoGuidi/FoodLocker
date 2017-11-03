Feature: Private Profile
As a user
I want to have a personal profile
So that I can set my profile public or private

Scenario: An user set his profile as private
Given the user logged in
When I go to personal profile
Then I should be able to change my profile in public or private
