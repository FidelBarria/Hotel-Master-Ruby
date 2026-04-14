class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :hotel_id ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role ])

    # Permitir campos adicionais na atualização da conta (account update)
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :role ])
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def require_turbo_frame
      unless turbo_frame_request?
        redirect_to rooms_path, alert: "Acesso não autorizado" and return
      end
    end

  def require_turbo_stream
    # Verifica se o Accept header contém turbo-stream
    unless request.format == :turbo_stream
      redirect_to rooms_path, alert: "Acesso não autorizado" and return
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para acessar esta página."
    redirect_to root_path
  end
end
