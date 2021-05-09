class Article < ApplicationRecord
  belongs_to :user
  attachment :post_img
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
