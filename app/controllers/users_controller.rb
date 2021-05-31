class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def interests
    @user = current_user
    @articles = current_user.interests_articles
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.id = current_user.id
    if @articles = Article.find_by(user_id: @user.id)
        @articles.destroy
    end
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def timeline
    @user = User.find(params[:id])
    @users = @user.following
    @articles = Article.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_img, :introduction, :is_deleted)
  end

end
