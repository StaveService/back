class LyristsController < ApplicationController
  before_action :set_lyrist, only: [:show, :update, :destroy]

  # GET /lyrists
  def index
    @lyrists = Lyrist.all

    render json: @lyrists
  end

  # GET /lyrists/1
  def show
    render json: @lyrist
  end

  # POST /lyrists
  def create
    @lyrist = Lyrist.new(lyrist_params)

    if @lyrist.save
      render json: @lyrist, status: :created, location: @lyrist
    else
      render json: @lyrist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lyrists/1
  def update
    if @lyrist.update(lyrist_params)
      render json: @lyrist
    else
      render json: @lyrist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lyrists/1
  def destroy
    @lyrist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyrist
      @lyrist = Lyrist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lyrist_params
      params.require(:lyrist).permit(:artist_id, :music_id)
    end
end
