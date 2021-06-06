class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #投稿記事検索
  before_action :set_search

  def set_search
    @search = Article.ransack(params[:q])
    @search_articles = @search.result.page(params[:page])
  end

end
