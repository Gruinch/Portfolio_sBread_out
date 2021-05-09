class ArticlesController < ApplicationController
  def new
    @article_new = Article.new
    @user = current_user
  end

  def create
    @article_new = Article.new(article_params)
    @article_new.user_id = current_user.id
    @article_new.save
    redirect_to article_path(@article_new)
  end

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :body, :post_img, :rate, :address, :latitude, :longitude)
  end

end
