class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  # PATCH/PUT /bands/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @user.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nickname, :familyname, :givenname, :introduction)
  end
end
