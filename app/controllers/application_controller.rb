class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def set_locale
    Mobility.locale = params[:locale]
  end
end
