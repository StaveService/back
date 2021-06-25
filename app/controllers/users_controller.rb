class UsersController < ApplicationController
  def destroy
    User.find(params[:id]).destroy
  end
end
