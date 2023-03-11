class Pet < ApplicationRecord
  belongs_to :user
  has_many :statuses

  validates :user_id, presence: true

  validates :name, presence: true
  validates :sex, presence: true
  validates :old, presence: true
end
