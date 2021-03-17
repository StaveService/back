class ComposersController < ApplicationController
  before_action :set_composer, only: [:show, :update, :destroy]

  # GET /composers
  def index
    @composers = Composer.all

    render json: @composers
  end

  # GET /composers/1
  def show
    render json: @composer
  end

  # POST /composers
  def create
    @composer = Composer.new(composer_params)

    if @composer.save
      render json: @composer, status: :created, location: @composer
    else
      render json: @composer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /composers/1
  def update
    if @composer.update(composer_params)
      render json: @composer
    else
      render json: @composer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /composers/1
  def destroy
    @composer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_composer
      @composer = Composer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def composer_params
      params.require(:composer).permit(:artist_id, :music_id)
    end
end
