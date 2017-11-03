When "I go to map" do
    visit map_path
end

Then "I should be able to find Gyms and Parks" do
    expect(page).to have_content("Park Gym")
end

Then "I should be able to find healthy food" do
    expect(page).to have_content("Supermarket")
end