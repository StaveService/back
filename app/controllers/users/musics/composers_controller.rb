class Users::Musics::ComposersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_music_composers

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
    @composer = @composers.new(artist_id: composer_params[:id])

    if @composer.save
      render json: @composer, status: :created
    else
      render json: @composer.errors, status: :unprocessable_entity
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
    @composers.find_by(artist_id: params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_music_composers
      @composers = current_user.musics.find(params[:music_id]).composers
    end

    # Only allow a trusted parameter "white list" through.
    def composer_params
      params.require(:composer).permit(:id, :user_id, :music_id, :artist_id)
    end
end
