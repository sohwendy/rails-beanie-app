class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: Rails.application.secrets.basic_user,
                               password: Rails.application.secrets.basic_auth
  protect_from_forgery with: :exception
end
