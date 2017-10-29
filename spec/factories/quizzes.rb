FactoryBot.define do
    factory :quiz do
        name "Pippo"
        gender "M"
        height "1.70"
        weight "65"
        age "20"
        water "3"
        sport true
        sport_time "45"
        target_weight "60"
        kcal "1300"
        user
    end

    factory :invalid_quiz, parent: :quiz do
        name nil
    end
end