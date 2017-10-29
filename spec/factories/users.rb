FactoryBot.define do
    factory :user do
        name "Pippo"
        email "pippo@pippo.it"
        password "paperino"
        password_confirmation "paperino"
    end
    
    factory :invalid_user, parent: :user do
        name nil
    end
end