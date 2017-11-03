Feature: Message
As a user
I want to chat with my followers
So that I can send messages to my followers

Scenario: User2 sends a message to user1
Given the user logged in
When I go to chat
Then I should be able to send messages to my followers
