class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    flash[:alert] = 'Você não está autorizado a realizar essa ação.'
    redirect_to(request.referrer || root_path)
  end

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'backoffice_devise'
    elsif devise_controller? && resource_name == :member
      'member_devise'
    else
      'application'
    end
  end
end
