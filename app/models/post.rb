class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true

  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  validates :image,  size: { less_than: 5.megabytes  }
end
