class VisitsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @visit = current_user.visits.new(article_id: params[:article_id])
    @visit.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    @visit = Visit.find_by(user_id: current_user.id, article_id: @article.id)
    @visit.destroy
  end
end
