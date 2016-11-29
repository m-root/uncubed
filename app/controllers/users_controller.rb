class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      sign_in(current_user, :bypass => true)
      redirect_to current_user
    else
      flash.now[:alert] = "oops"
      render :edit
    end

  end


  private
    def check_authorization
      unless current_user.id == params[:id].to_i
        redirect_to root_url
      end
    end

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end