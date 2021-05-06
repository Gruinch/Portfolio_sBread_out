class ArticlesController < ApplicationController
  def new
    @article_new = Article.new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def article_params
    params.require(:article).permit(:user_id, :title, :body, :post_img_id, :rate, :address, :latitude, :longtitude)
  end

end
