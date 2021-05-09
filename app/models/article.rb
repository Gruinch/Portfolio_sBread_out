class Article < ApplicationRecord
  belongs_to :user
  attachment :post_img
  geocoded_by :address
end
