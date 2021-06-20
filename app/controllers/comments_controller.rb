class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.save
    render :index
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find_by(id: params[:id], article_id: params[:article_id])
    @comment.destroy
    render :index
  end

 private

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end
end
