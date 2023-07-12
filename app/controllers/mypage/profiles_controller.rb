# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  before_action :set_user, only: %i[show update]
  def show;end

  def update
    if @user.update(profile_params)
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
      render :show
    end
  end

  private

  def set_user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find(current_user.id)
    end
  end

  def profile_params
    params.require(:user).permit(:name, :avatar, :email, :hobby, :profile)
  end
end
