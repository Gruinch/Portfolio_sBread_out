class Relationship < ApplicationRecord
  #自分をフォローしているユーザー
  belongs_to :user, class_name: "User"
  #自分がフォローしているユーザー
  belongs_to :following, class_name: "User"
  #バリデーション
  validates :user_id, presence: true
  validates :following_id, presence: true
end
