class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    def index
        @users = User.all

        render json: @users
    end

    def show
        render json: @user, include: [:bookmarked_artists, :bookmarked_bands, :bookmarked_musics, musics: {include: [:user, :band, :composers, :lyrists, :bookmarks]} ]
    end

    def set_user
        @user = User.find(params[:id])
    end
end
