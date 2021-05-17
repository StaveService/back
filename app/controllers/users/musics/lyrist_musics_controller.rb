class Users::Musics::LyristMusicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lyrists
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
      render json: @lyrist, status: :created
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
    @lyrists.find_by(artist_id: params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyrists
      @lyrists = current_user.musics.find(params[:music_id]).lyrists
    end

    # Only allow a trusted parameter "white list" through.
    def lyrist_params
      params.require(:lyrist).permit(:id, :user_id, :music_id, :artist_id)
    end
end
