class BandsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_band, only: %i[update destroy]

  # POST /bands
  def create
    I18n.locale = params[:locale]
    @band = Band.new(band_params)

    if @band.save
      render json: @band, include: :link, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    I18n.locale = params[:locale]
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band
    @band = Band.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def band_params
    params.require(:band).permit(:name, link_attributes: [:itunes])
  end
end
