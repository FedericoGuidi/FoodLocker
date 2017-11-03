Then "I should be able to set notification about workout" do
    fill_in "Workout time", with: "10:00"
    click_button "Save changes"
    expect(User.find(2).workout_time.to_s(:time)).to eq("10:00")
end

Then "I should be able to set notification about eating" do
    fill_in "Eat time", with: "13:00"
    click_button "Save changes"
    expect(User.find(2).eat_time.to_s(:time)).to eq("13:00")
end

Then "I should be able to set notification about drinking" do
    fill_in "Drink time", with: "8:00"
    click_button "Save changes"
    expect(User.find(2).drink_time.to_s(:time)).to eq("08:00")
end

Then "I should be able to set notification about recording weight" do
    fill_in "Weight time", with: "7:00"
    click_button "Save changes"
    expect(User.find(2).weight_time.to_s(:time)).to eq("07:00")
end
