class Article < ApplicationRecord
  belongs_to :user
  attachment :post_img
end
