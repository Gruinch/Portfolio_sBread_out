class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :visits, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :address, presence: true
  validates :post_img, presence: true

  attachment :post_img

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
