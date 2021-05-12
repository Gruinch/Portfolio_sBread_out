class Relationship < ApplicationRecord
  #自分をフォローしているユーザー
  belongs_to :follower, class_name: 'User', optional: true
  #自分がフォローしているユーザー
  belongs_to :user, class_name: 'User'
  #バリデーション
end
