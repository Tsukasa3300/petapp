class Status < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user_id, presence: true
  validates :pet_id, presence: true

  validates :food, presence: true
  validates :weight, presence: true
  validates :temperature, presence: true
end
