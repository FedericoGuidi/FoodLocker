Feature: Recipe
As a user
I want to insert an ingredient in a searchbar
So that I can research a recipe

Scenario: An user researches a recipe by ingredient
Given the user logged in
When I go to recipe
Then I should be able to research a recipe by ingredient
