FactoryBot.define do
    factory :recipe do
        title "Titolo"
        kcal "1200"
        ingredients "ingredienti"
        directions "indicazioni"
        user
    end

    factory :invalid_recipe, parent: :recipe do
        title nil
    end
end