class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = USer.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
