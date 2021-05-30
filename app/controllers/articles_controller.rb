class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @user = current_user
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render new_article_path
    end
  end

  def index
    @articles = Article.page(params[:page]).reverse_order
  end

  def search_result
    
  end

  def show
    @article = Article.find(params[:id])
    if user_signed_in?
      @interest = Interest.find_by(user_id: current_user.id, article_id: @article.id)
      @visit = Visit.find_by(user_id: current_user.id, article_id: @article.id)
    end
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :body, :post_img, :rate, :address, :latitude, :longitude)
  end

end
