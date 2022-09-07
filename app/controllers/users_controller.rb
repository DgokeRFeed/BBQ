class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_current_user, except: %i[show]

  def show
    @user = User.find_by!(username: params[:username])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t("controllers.users.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
    def set_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :avatar)
    end
end
