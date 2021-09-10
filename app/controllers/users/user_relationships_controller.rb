module Users
  class UserRelationshipsController < ApiController
    before_action :authenticate_user!

    # POST /user_relationships
    def create
      @user_relationship = current_user.active_relationships.new(followed_id: params[:user_id])

      if @user_relationship.save
        render json: @user_relationship, status: :created
      else
        render json: @user_relationship.errors, status: :unprocessable_entity
      end
    end

    # DELETE /user_relationships/1
    def destroy
      current_user.active_relationships.find(params[:id]).destroy
    end
  end
end
