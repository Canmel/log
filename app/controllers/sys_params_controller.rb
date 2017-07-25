class SysParamsController < ApplicationController
  load_and_authorize_resource except: [:create]
  def index
    @q = SysParam.ransack(params[:q])
  end

  def create
    @sys_param = SysParam.new(sys_param_params)
    if @sys_param.save
      flash[:notice] = "保存成功"
      redirect_to :sys_params
    else
      flash[:notice] = '保存失败'
      render :new
    end
  end

  def update
    if @sys_param.update(sys_param_params)
      flash[:notice] = '修改成功'
      redirect_to :sys_params
    else
      flash[:notice] = '修改失败'
      render :edit
    end
  end

  def destroy
    if @sys_param.destroy
      flash[:notice] = '删除成功'
    else
      flash[:notice] = '删除失败'
    end
    redirect_to :sys_params
  end

  private

  def sys_param_params
    params.require(:sys_param).permit(:name, :desc, :val, :code)
  end
end
