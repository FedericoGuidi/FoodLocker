class Quiz < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}, format: {with: /[a-zA-Z ]+/, message: "Attention! It only allows letters!"}
    validates :gender, presence: true, length: {maximum: 1}, format: {with: /M|F/, message: "Attention! Insert M or F!"}
    validates :height, presence: true, length: {maximum: 10}, format: {with: /[0-9]+\.[0-9]+/, message: "Attention! Insert a correct format of height (ex: 1.69)"}
    validates :weight, presence: true, format: {with: /[0-9]+/, message: "Attention! Insert a correct format of weight!"}
    validates :age, presence: true, format: {with: /[0-9]+/, message: "Attention! Insert a correct format of age!"}
    validates :sport_time, format: {with: /[0-9]+/, message: "Attention! Insert a correct format of sport time!"}
    validates :water, presence: true, format: {with: /[0-9.]+|[0-9]+/, message: "Attention! Insert a correct format of water you drink!"}
    validates :target_weight, presence: true, format: {with: /[0-9]+/, message: "Attention! Insert a correct format of weight target!"}
    belongs_to :user
end
