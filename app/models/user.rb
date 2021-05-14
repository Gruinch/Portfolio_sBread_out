class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :articles, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :interests, dependent: :destroy
 has_many :visits, dependent: :destroy

 #following機能について
# フォロ-
 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
 has_many :following, through: :following_relationships
# フォロワー
 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 has_many :followers, through: :follower_relationships

 #フォローしているかを確認
 def following?(user)
   following_relationships.find_by(following_id: user.id)
 end

 #フォローメソッド
def follow(user)
  following_relationships.create!(following_id: user.id)
end

 #アンフォローメソッド
 def unfollow(user)
   following_relationships.find_by(following_id: user.id).destroy
 end

 #すでに「気になる」「行ったよ」押している
 def already_interested?(article)
   self.interests.exists?(article_id: article.id)
 end

 def already_visited?(article)
   self.visits.exists?(article_id: article.id)
 end


 attachment :profile_img
end
