class ArtistMusicsController < ApplicationController
    def create
        @music.artist_musics.save(artist_id: params[:artist_id])
        render json: @music
    end

    def destroy
        @artist_music = ArtistMusic.find_by(artist_id: params[:post_id], music_id: params[:music_id])
        @artist_music.destroy
    end

    def set_music
        @music = Music.find(params[:music_id])
    end
end
