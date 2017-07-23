class UsersController < ApplicationController
  load_and_authorize_resource only: [:new, :edit, :index]

  def index
    @q = User.ransack(params[:q])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/users'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :id, :password ,:email , :password_confirmation, :role_ids => [])
  end
end
