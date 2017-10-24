module AuthHelper
  def http_login
    user = Rails.application.secrets.basic_user
    pw = Rails.application.secrets.basic_auth
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end