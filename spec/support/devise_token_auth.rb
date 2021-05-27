module DeviseTokenAuthHelpers
  def login(user)
    post user_session_path, params: { email: user.email, password: user.password }.to_json,
                            headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  # rubocop:disable Metrics/MethodLength
  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token-type' => token_type
    }
  end
  # rubocop:enable Metrics/MethodLength
end

RSpec.configure do |config|
  config.include DeviseTokenAuthHelpers
  config.include ActionController::RespondWith
end
