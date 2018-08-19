class Admin::ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "user", password: "password"

  layout 'admin/application'
end
