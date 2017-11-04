class Recipe < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :kcal, presence: true, format: {with: /[0-9]+/, message: "Attention! Insert a correct format!"}
  validates :ingredients, presence: true
  validates :directions, presence: true
    
    mount_uploader :photo, PictureUploader
end
