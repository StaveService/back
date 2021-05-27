class Users::Musics::IssuesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_issues
  before_action :set_issue, only: %i[show update destroy]

  # GET /issues
  def index
    render json: @issues.ransack(params[:q] && JSON.parse(params[:q])).result
  end

  # GET /issues/1
  def show
    render json: @issue
  end

  # POST /issues
  def create
    @issue = @issues.new(user_id: current_user.id, title: issue_params[:title], description: issue_params[:description])
    if @issue.save
      render json: @issue, status: :created
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issues
    @issues = User.find(params[:user_id]).musics.find(params[:music_id]).issues
  end

  def set_issue
    @issue = @issues.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def issue_params
    params.require(:issue).permit(:user_id, :music_id, :title, :description)
  end
end
