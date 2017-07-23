class MenusController < ApplicationController
  load_and_authorize_resource only: [:index, :new, :edit]

  def index
    params[:q] ||= ActionController::Parameters.new
    params[:q][:status_eq] = Menu.statuses[:active]
    @q = Menu.ransack(params[:q])
    @menus = @q.result.page(@page).per(@page_size)
    @menus.total_count
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to :menus
    else
      render :new
    end
  end

  def new
    @menu.resource_type = Menu.resource_types[:two_level]
  end

  private

  def menu_params
    params.require(:menu).permit(:id, :name, :desc, :source, :parent_id, :created_at, :updated_at, :status, :resource_type)
  end
end