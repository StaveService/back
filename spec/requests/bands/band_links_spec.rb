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

RSpec.describe '/band_links', type: :request do
  let(:user) { create(:user) }
  let(:band) { create(:band) }
  let(:band_link) { create(:band_link, band: band) }
  let(:headers) do
    login user
    get_auth_params_from_login_response_headers(response)
  end

  context 'when PUT /band/links' do
    it 'with Authorization header' do
      put band_band_link_path(band_id: band.id, id: band_link.id), params: { band_link: attributes_for(:band_link) },
                                                                   headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      put band_band_link_path(band_id: band.id, id: band_link.id), params: { band_link: attributes_for(:band_link) }
      expect(response).to have_http_status :unauthorized
    end
  end

  context 'when PATCH /band/links' do
    it 'with Authorization header' do
      patch band_band_link_path(band_id: band.id, id: band_link.id), params: { band_link: attributes_for(:band_link) },
                                                                     headers: headers
      expect(response).to have_http_status :ok
    end

    it 'without Authorization header' do
      patch band_band_link_path(band_id: band.id, id: band_link.id), params: { band_link: attributes_for(:band_link) }
      expect(response).to have_http_status :unauthorized
    end
  end
end
