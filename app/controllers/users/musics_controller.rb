module Users
  class MusicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_music, only: %i[destroy]
    before_action :set_locale

    # POST /musics
    def create
      @music = current_user.musics.new music_params

      if @music.save
        render json: @music, include: :link, status: :created
      else
        render json: @music.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /musics/1
    def update
      @music = User.find(params[:user_id]).musics.find(params[:id])

      if @music.update(music_params)
        render json: @music
      else
        render json: @music.errors, status: :unprocessable_entity
      end
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

    def set_locale
      Mobility.locale = params[:locale]
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:title, :tab, link_attributes: [:itunes])
    end
  end
end
