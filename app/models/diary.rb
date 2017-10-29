class Diary < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
end
