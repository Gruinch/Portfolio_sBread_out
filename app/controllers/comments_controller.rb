class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    comment = current_user.comments.new(comment_params)
    comment.article_id = @article.id
    comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    comments = Comment.find_by(id: params[:id], article_id: params[:article_id])
    comments.destroy
    redirect_to article_path(@article)
  end

 private

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end
end
