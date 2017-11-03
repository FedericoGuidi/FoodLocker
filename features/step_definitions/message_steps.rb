When "I go to chat" do
    visit conversations_path
end

Then "I should be able to send messages to my followers" do
    click_link "Message me!"
    fill_in "message_body", with: "Hello admin!"
    click_button "Send"
    expect(page).to have_content("Hello admin!")
end
