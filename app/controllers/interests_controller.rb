class InterestsController < ApplicationController


  def create
    @article = Article.find(params[:article_id])
    @interest = current_user.interests.new(article_id: params[:article_id])
    @interest.save
  end

  def index
    @interests = Interest.all
  end

  def destroy
    @article = Article.find(params[:article_id])
    @interest = Interest.find_by(user_id: current_user.id, article_id: @article.id)
    @interest.destroy
  end


end
