class ApplicationController < ActionController::Base
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_attributes = [:first_name, :last_name, :middle_name, :mobile, :account_type]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
  end

end
