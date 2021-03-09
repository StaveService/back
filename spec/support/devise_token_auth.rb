module DeviseTokenAuthHelpers
    def login
        post api_user_session_path, params:  { email: @current_user.email, password: 'password' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    end

    def get_auth_params_from_login_response_headers(response)
        client = response.headers['client']
        token = response.headers['access-token']
        expiry = response.headers['expiry']
        token_type = response.headers['token-type']
        uid = response.headers['uid']

        auth_params = {
            'access-token' => token,
            'client' => client,
            'uid' => uid,
            'expiry' => expiry,
            'token-type' => token_type
        }
        auth_params
    end
end

RSpec.configure do |config|
    config.include DeviseTokenAuthHelpers
end