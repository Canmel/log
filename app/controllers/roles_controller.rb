class RolesController < ApplicationController
  load_and_authorize_resource only: [:new, :edit, :index]

  def index
    @q = Role.ransack(params[:q])
  end

  def create
    role = Role.new(role_params)
    if role.save
      redirect_to :roles
    else
      render :new
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to :roles
    else
      render :edit
    end
  end

  private

  def role_params
    params.require(:role).permit(:id, :name, :resource_type, :resource_id, :created_at, :updated_at, :menu_ids => [])
  end
end
