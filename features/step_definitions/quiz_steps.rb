When "I login with user2" do
    fill_in 'Email', with: "food-2@locker.com"
    fill_in 'Password', with: "password"
    click_button "Log in"
end

When "I go to quiz" do
    visit edit_quiz_path(User.find(2))
end

Then "I should be able to set my life characteristics" do
    fill_in "What's your name?", with: "Privato"
    fill_in "Are you a male or a female?", with: "M"
    fill_in 'How tall are you?', with: "1.70"
    fill_in 'How much do you weigh?', with: "60"
    fill_in 'How old are you?', with: "25"
    fill_in 'How much water do you drink?', with: "2"
    fill_in 'How much do you work out?', with: "0"
    fill_in "What's your weight target?", with: "55"
    fill_in 'Daily kcal', with: "1500"
    click_button "Save changes"
    expect(page).to have_content("Quiz created")
end

Then "I should be able to update my characteristics" do
    fill_in 'Daily kcal', with: "1501"
    click_button "Save changes"
    expect(User.find(2).quiz.kcal).to eq("1501")
end