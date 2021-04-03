class Users::Musics::LyristsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_current_user_music_lyrists, only: [:create, :destroy]
  before_action :set_lyrist, only: [:destroy]

  # # GET /composers
  # def index
    # @composers = Composer.all

    # render json: @composers
  # end

  # # GET /composers/1
  # def show
    # render json: @composer
  # end

  # POST /composers
  def create
    @lyrist = @lyrists.new(artist_id: lyrist_params[:id])

    if @lyrist.save
      render json: @lyrist, status: :created, location: @lyrist
    else
      render json: @lyrist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /composers/1
  # def update
    # if @composer.update(composer_params)
      # render json: @composer
    # else
      # render json: @composer.errors, status: :unprocessable_entity
    # end
  # end

  # DELETE /composers/1
  def destroy
    @lyrist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_music_lyrists
      @lyrists = current_user.musics.find(params[:music_id]).lyrists
    end

    def set_lyrist
      @lyrist = @lyrists.find_by(artist_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lyrist_params
      params.require(:lyrist).permit(:id, :user_id, :music_id, :artist_id)
    end
end
