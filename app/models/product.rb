class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: { maximum: 255 },
                   uniqueness: { case_sensitive: false }
end
