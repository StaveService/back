class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def sign_up_params
    params.permit(:nickname, :image, :email, :familyname, :givenname, :password, :password_confirmation, :introduction, :gender,
                  :birthday)
  end
end
