class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :user_valid

  def user_valid
    raise CanCan::AccessDenied if !request.fullpath.include?("/auth/") && current_user.nil?
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if User.count == 1
        resource.add_role 'admin'
      end
      resource
    end
    root_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    p current_user
    if current_user
      render file: "#{Rails.root}/public/422.html", status: 403, layout: false
    else
      redirect_to "/auth/login"
    end
  end
end
