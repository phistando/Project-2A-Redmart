class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name,
            presence: true,
            length: { maximum: 50, message: 'Name is too long' }

end
