Given "the admin logged in" do
	visit login_path
    fill_in 'Email', with: 'admin@foodlocker.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
end

When "I go to personal profile" do
    visit edit_user_path(User.find(2))
end

When "I go to users list" do
    visit users_path
end

When "I go to private profile" do
    visit user_path(User.find(3))
end

When "I go to special options" do
    visit specialoptions_path
end

Then "I should be able to ban users" do
    find('input#user_banned').click
    click_button 'Save changes'
    expect(User.find(2).banned).to be_truthy
end

Then "I should be able to promote users" do
    find('input#user_admin').click
    click_button 'Save changes'
    expect(User.find(2).admin).to be_truthy
end

Then "I should be able to demote users" do
    find('input#user_admin').click
    click_button 'Save changes'
    visit edit_user_path(User.find(2))
    find('input#user_admin').click
    click_button 'Save changes'
    visit edit_user_path(User.find(2))
    expect(User.find(2).admin).to_not be_truthy
end

Then "I should be able to delete users" do
    visit edit_user_path(User.last)
    user_id = User.last.id
    click_button "Delete your account"
    expect(User.last.id).to_not eq(user_id)
end

Then "I should be able to view user account" do
    expect(page).to have_selector(:link_or_button, 'Edit')
end

Then "I should be able to suspend website" do
    find('input#suspended').click
    click_button 'Save changes'
    expect(Site.first.suspended).to be_truthy
end
