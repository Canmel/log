class MenusController < ApplicationController
  load_and_authorize_resource except: [:create]

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
      flash[:notice] = "保存成功"
      redirect_to :menus
    else
      flash[:notice] = "保存失败"
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "更新成功"
      redirect_to :menus
    else
      flash[:notice] = "更新失败"
      render :edit
    end
  end

  def destroy
    if @menu.update(status: Menu.statuses[:archived])
      flash[:notice] = "删除成功"
    else
      flash[:notice] = "删除失败"
    end
    redirect_to :menus
  end

  def new
    @menu.resource_type = Menu.resource_types[:two_level]
  end

  private

  def menu_params
    params.require(:menu).permit(:id, :name, :desc, :source, :parent_id, :created_at, :updated_at, :status, :resource_type)
  end
end