class Users::Musics::RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_music_roles
  def create
    @role = @roles.new(role: role_params[:role], artist_id: role_params[:artist_id])

    if @role.save
      render json: @role, status: :created, include: :artist
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @roles.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_music_roles
      @roles = current_user.musics.find(params[:music_id]).roles
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.permit(:role, :artist_id, :user_id, :music_id)
    end
end
