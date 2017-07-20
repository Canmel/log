class HomeController < ApplicationController
  authorize_resource class: User
  def index

  end

end
