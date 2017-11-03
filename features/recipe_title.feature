Feature: Recipe
As a user
I want to insert a title in a searchbar
So that I can research a recipe

Scenario: An user researches a recipe by title
Given the user logged in
When I go to recipe
Then I should be able to research a recipe by title
