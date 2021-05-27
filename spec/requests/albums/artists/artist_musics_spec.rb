require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/artist_musics', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # ArtistMusic. As you add validations to ArtistMusic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ArtistMusicsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      ArtistMusic.create! valid_attributes
      get artist_musics_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      artist_music = ArtistMusic.create! valid_attributes
      get artist_music_url(artist_music), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ArtistMusic' do
        expect do
          post artist_musics_url,
               params: { artist_music: valid_attributes }, headers: valid_headers, as: :json
        end.to change(ArtistMusic, :count).by(1)
      end

      it 'renders a JSON response with the new artist_music' do
        post artist_musics_url,
             params: { artist_music: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ArtistMusic' do
        expect do
          post artist_musics_url,
               params: { artist_music: invalid_attributes }, as: :json
        end.to change(ArtistMusic, :count).by(0)
      end

      it 'renders a JSON response with errors for the new artist_music' do
        post artist_musics_url,
             params: { artist_music: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested artist_music' do
        artist_music = ArtistMusic.create! valid_attributes
        patch artist_music_url(artist_music),
              params: { artist_music: new_attributes }, headers: valid_headers, as: :json
        artist_music.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the artist_music' do
        artist_music = ArtistMusic.create! valid_attributes
        patch artist_music_url(artist_music),
              params: { artist_music: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the artist_music' do
        artist_music = ArtistMusic.create! valid_attributes
        patch artist_music_url(artist_music),
              params: { artist_music: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested artist_music' do
      artist_music = ArtistMusic.create! valid_attributes
      expect do
        delete artist_music_url(artist_music), headers: valid_headers, as: :json
      end.to change(ArtistMusic, :count).by(-1)
    end
  end
end
