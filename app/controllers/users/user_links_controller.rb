module Users
  class UserLinksController < ApplicationController
    before_action :set_user_link, only: %i[show update destroy]

    # PATCH/PUT /user_links/1
    def update
      if @user_link.update(user_link_params)
        render json: @user_link
      else
        render json: @user_link.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user_link
      @user_link = UserLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_link_params
      params.require(:user_link).permit(:references, :twitter)
    end
  end
end
