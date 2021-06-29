class Users::UserRelationshipsController < ApplicationController
  before_action :authenticate_user!

  # GET /user_relationships
  # def index
    # @user_relationships = UserRelationship.all

    # render json: @user_relationships
  # end

  # # GET /user_relationships/1
  # def show
    # render json: @user_relationship
  # end

  # POST /user_relationships
  def create
    @user_relationship = current_user.active_relationships.new(followed_id: params[:user_id])

    if @user_relationship.save
      render json: @user_relationship, status: :created
    else
      render json: @user_relationship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_relationships/1
  # def update
    # if @user_relationship.update(user_relationship_params)
      # render json: @user_relationship
    # else
      # render json: @user_relationship.errors, status: :unprocessable_entity
    # end
  # end

  # DELETE /user_relationships/1
  def destroy
    current_user.active_relationships.find_by(id: params[:id]).destroy
  end
end
