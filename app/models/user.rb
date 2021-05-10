class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :articles, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :interests, dependent: :destroy
 has_many :visits, dependent: :destroy
 
 #すでに「気になる」「行ったよ」押している
 def already_interested?(article)
   self.interests.exists?(article_id: article.id)
 end
 
 def already_visited?(article)
   self.visits.exists?(article_id: article.id)
 end

 
 attachment :profile_img
end
