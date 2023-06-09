class User < ApplicationRecord
    has_many :pets, dependent: :destroy
    has_many :statuses
    has_many :posts

    has_many :likes, dependent: :destroy
    has_many :likes_posts, through: :likes, source: :post
    
    
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    has_secure_password

    def like(post)
        likes_posts << post
    end
     
    
    def unlike(post)
        likes_posts.destroy(post)
    end
    
    def like?(post)
        likes_posts.include?(post)
     end
end
