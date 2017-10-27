class Day < ApplicationRecord
    belongs_to :diary
    
    validates:breakfast, presence: true
    validates:breakfast_kcal, presence: true
    validates:snack, presence: true
    validates:snack_kcal, presence: true
    validates:lunch, presence: true
    validates:lunch_kcal, presence: true
    validates:dinner, presence: true
    validates:dinner_kcal, presence: true
end
