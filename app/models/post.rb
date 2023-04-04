class Post < ApplicationRecord
  belongs_to :user
  has_many :users, through: :likes
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true

  has_one_attached :image
end
