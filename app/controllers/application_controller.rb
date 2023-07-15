# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  add_flash_types :success, :info, :warning, :danger

  private  

  def require_login
    redirect_to login_path, warning: 'ログインしてください' if current_user.blank?
  end
end
