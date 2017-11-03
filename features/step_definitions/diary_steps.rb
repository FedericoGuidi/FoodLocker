When "I go to diary" do
    visit edit_diary_path(User.find(2))
end

Then "I should be able to see breakfast kcal" do
    expect(page).to have_content("Breakfast kcal")
end

Then "I should be able to see snack kcal" do
    expect(page).to have_content("Snack kcal")
end

Then "I should be able to see lunch kcal" do
    expect(page).to have_content("Lunch kcal")
end

Then "I should be able to see dinner kcal" do
    expect(page).to have_content("Dinner kcal")
end

Then "I should be able to write comment on my day" do
    fill_in "Note", with: "Today I ate very well. Pizza is good."
    click_button "Save changes"
    expect(User.find(2).diary.days.last.note).to have_content("Pizza")
end
