class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :content, presence: true
  validates :user_id, presence: true

  has_one_attached :image
end
