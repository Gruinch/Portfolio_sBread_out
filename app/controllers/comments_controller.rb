class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    article = Article.find(params[:article_id])
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(article)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
 private

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end
end
