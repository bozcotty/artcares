class ApplicationController < ActionController::Base
  add_breadcrumb "home", :root_path

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end  


end
