class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  validates_uniqueness_of :item_id, scope: :user_id
end
