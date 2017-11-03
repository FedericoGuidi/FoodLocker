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

Then "I should be able to sign up" do
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'food-3@locker.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_button "Create my account"
    expect(page).to have_content("activate")
end

Then "I should be able to login" do
    click_button "Log in"
    expect(page).to have_content("following")
end

Then "I should be able to logout" do
    click_link "Log out"
    expect(page).to have_content("Welcome")
end

Then "I should be able to change my e-mail" do
    fill_in 'Email', with: 'food-11@locker.com'
    click_button "Save changes"
    expect(User.find(2).email).to eq("food-11@locker.com")
end

Then "I should be able to change my password" do
    fill_in 'Password', with: 'password2'
    fill_in 'Confirmation', with: 'password2'
    click_button "Save changes"
    expect(page).to have_content("Profile updated")
end

Then "I should be able to login with Facebook" do
    expect(page).to have_content("Have a Facebook account? Log in here!")
end

Then "I should be able to delete my account" do
    count = User.count
    click_button "Delete your account"
    expect(User.count).to eq(count-1)
end

Then "I should be able to change my nickname" do
    fill_in 'Nickname', with: 'FoodLocker'
    click_button "Save changes"
    expect(User.find(2).nickname).to eq("FoodLocker")
end

Then "I should be able to change my photo" do
    find('input#user_avatar').click
    click_button "Save changes"
end

Then "I should be able to change my profile in public or private" do
    find('input#user_is_private').click
    click_button 'Save changes'
    expect(User.find(2).is_private).to be_truthy
end