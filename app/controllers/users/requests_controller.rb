module Users
  class RequestsController < ApiController
    before_action :authenticate_user!, only: %i[create update destroy]
    before_action :set_requests
    before_action :set_request, only: %i[show update destroy]

    # GET /requests
    def index
      render json: @requests
    end

    # GET /requests/1
    def show
      render json: @request
    end

    # POST /requests
    def create
      @request = @requests.new(request_params)

      if @request.save
        render json: @request, status: :created, location: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /requests/1
    def update
      if @request.update(request_params)
        render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
    end

    # DELETE /requests/1
    def destroy
      @request.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_requests
      @requests = User.find(params[:user_id]).requests
    end

    def set_request
      @request = @requests.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:user_id, :title)
    end
  end
end
