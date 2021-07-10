module Users
  class MusicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_music, only: %i[update destroy]
    # POST /musics
    def create
      @music = current_user.musics.new music_params

      repo_path = Rails.root.join('repositories', current_user.id.to_s, "#{@music.title}.git")
      FileUtils.mkdir_p(repo_path)
      repository = Rugged::Repository.init_at(repo_path, :bare)
      repository.config['http.receivepack'] = true

      if @music.save
        render json: @music, include: :link, status: :created
      else
        render json: @music.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /musics/1
    def update
      if @music.update(music_params)
        render json: @music
      else
        render json: @music.errors, status: :unprocessable_entity
      end
      current_user.musics.find(params[:id]).destroy
    end

    # DELETE /musics/1
    def destroy
      @music.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = current_user.musics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_params
      params.require(:music).permit(:title, :tab, link_attributes: [:itunes])
    end
  end
end
