class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    def index
        @users = User.all

        render json: @users
    end

    def show
        render json: @user, include: [musics: {include: [:band, :music_composers, :music_lyrists]} ]
    end

    def set_user
        @user = User.find(params[:id])
    end
end
