class Notification < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :time, presence: true
  validates :ntype, presence: true
end
