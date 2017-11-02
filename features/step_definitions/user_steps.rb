Given "the user logged in" do
    visit login_path
    fill_in 'Email', with: 'food-1@locker.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
end

When "I go to login page" do
    visit login_path
end

When "I go to sign up page" do
    visit signup_path
end

When "I write email and password" do
    fill_in 'Email', with: 'food-1@locker.com'
    fill_in 'Password', with: 'password'
end

Then "I should be able to login" do
    click_button "Log in"
    expect(page).to have_content("following")
end

Then "I should be able to logout" do
    click_link "Log out"
    expect(page).to have_content("Welcome")
end