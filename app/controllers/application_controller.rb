class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :profession, :company_name, :description ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :profession, :company_name, :description ])
  end

  # include Pundit::Authorization

  # # Pundit: allow-list approach
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
