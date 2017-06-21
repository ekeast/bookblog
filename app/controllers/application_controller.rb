require 'omniauth-facebook'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @first = Post.order("created_at").first


  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_first
    @first = Post.all.order("created_at")[1]
  end

  def set_second
    @second = Post.all.order("created_at")[2]
  end

  helper_method :current_user
  helper_method :set_first
  helper_method :set_second
end
