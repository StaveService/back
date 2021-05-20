class Users::MusicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_music, only: [:update, :destroy]
  # POST /musics
  def create
    @music = current_user.musics.new music_params

    if @music.save
      render json: @music, status: :created
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /musics/1
  def update
    if @music.update(music_params)
      render json: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
    current_user.musics.find(params[:id]).destroy
  end

  # DELETE /musics/1
  def destroy
    @music.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = current_user.musics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:title, :tab, music_link_attributes: [:itunes])
    end
end
