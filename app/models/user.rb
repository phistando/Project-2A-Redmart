class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save { email.downcase! }


  EMAIL_REGEX =
  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :name,
            presence: true,
            length: { maximum: 50, message: 'Name is too long' }

  validates :email,
              presence: true,
              length: { maximum: 50 },
              format: { with: EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

# FOR HASHING PASSWORD
has_secure_password

def feed
    Review.where("user_id = ?", id)
  end

end
