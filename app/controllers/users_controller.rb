class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.ransack(params[:q])
  end

  private

  def user_params
    params.require(:user).permit(:name, :id, :password ,:email , :password_confirmation, :role_ids => [])
  end
end
