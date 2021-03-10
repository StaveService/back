require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "/user" do
    let(:user) { create(:user) }
    let(:user_id) { user.id }
    context "GET /users" do
      it { is_expected.to eq(200) }
    end

    context "GET /users/:user_id" do
      it { is_expected.to eq(200) }
    end

    context "gives you a status 200 on signing in " do
      it do 
        login user
        expect(response.status).to eq(200)
      end
    end
  end

  describe "/user" do
    let(:user) { create(:user) }
    let(:user_id) { user.id }

    describe "/music" do
      let(:music) { create(:music, user: user) }
      let(:music_id) { music.id }
      context "GET /users/:user_id/musics" do
        it { is_expected.to eq(200) }
      end

      context "GET /users/:user_id/musics/:music_id" do
        it { is_expected.to eq(200) }
      end

      context "POST /users/:user_id/musics" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            post user_musics_path(user), params: { music: attributes_for(:music) }, headers: headers
            expect(response).to have_http_status :created
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            post user_musics_path(user), params: { music: attributes_for(:music, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end

      context "PUT /users/:user_id/musics/:music_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            put user_music_path(user, music), params: { music: attributes_for(:music, title: "update title") }, headers: headers
            expect(response).to have_http_status :ok
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            put user_music_path(user, music), params: { music: attributes_for(:music, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end

      context "PATCH /users/:user_id/musics/:music_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            patch user_music_path(user, music), params: { music: attributes_for(:music, title: "update title") }, headers: headers
            expect(response).to have_http_status :ok
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            patch user_music_path(user, music), params: { music: attributes_for(:music, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end


      context "DELETE /users/:user_id/musics/:music_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            delete user_music_path(user, music), headers: headers
            expect(response).to have_http_status :no_content
          end
        end
      end
    end

    describe "/request" do
      let(:request) { create(:request, user: user) }
      let(:request_id) { request.id }
      context "GET /users/:user_id/requests" do
        it { is_expected.to eq(200) }
      end

      context "GET /users/:user_id/requests/:request_id" do
        it {is_expected.to eq(200)}
      end

      context "POST /users/:user_id/requests" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            post user_requests_path(user), params: { request: attributes_for(:request) }, headers: headers
            expect(response).to have_http_status :created
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            post user_requests_path(user), params: { request: attributes_for(:request, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end

      context "PUT /users/:user_id/requests/:request_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            put user_request_path(user, request), params: { request: attributes_for(:request, title: "update title") }, headers: headers
            expect(response).to have_http_status :ok
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            put user_request_path(user, request), params: { request: attributes_for(:request, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end

      context "PATCH /users/:user_id/requests/:request_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            patch user_request_path(user, request), params: { request: attributes_for(:request, title: "update title") }, headers: headers
            expect(response).to have_http_status :ok
          end
        end

        context "with headers & invalid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            patch user_request_path(user, request), params: { request: attributes_for(:request, title: "") }, headers: headers
            expect(response).to have_http_status :unprocessable_entity
          end
        end
      end


      context "DELETE /users/:user_id/requests/:request_id" do
        context "without headers" do
          it { is_expected.to eq(401) }
        end

        context "with headers & valid params" do
          it do
            login user
            headers = get_auth_params_from_login_response_headers(response)
            delete user_request_path(user, request), headers: headers
            expect(response).to have_http_status :no_content
          end
        end
      end
    end
  end
end
