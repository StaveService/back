class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  def set_locale
    Mobility.locale = params[:locale]
  end
end
