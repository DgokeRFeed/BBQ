class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find_by!(username: params[:username])
    end

    def user_params
      params.require(:user).permit(:name, :username, :email)
    end
end
