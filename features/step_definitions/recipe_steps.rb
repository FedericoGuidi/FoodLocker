When "I go to recipe" do
    visit recipes_path
end

Then "I should be able to research a recipe by title" do
    fill_in "search", with: "Cioccolato"
    click_button "Search"
    expect(page).to have_content("Spiedini di frutta e cioccolato")
end

Then "I should be able to research a recipe by ingredient" do
    fill_in "search", with: "ananas fresco"
    click_button "Search"
    expect(page).to have_content("Spiedini di frutta e cioccolato")
end

Then "I should be able to research a recipe by kcal" do
    fill_in "kcal_max", with: "300"
    click_button "Search"
    expect(page).to have_content("Spiedini di frutta e cioccolato")
end