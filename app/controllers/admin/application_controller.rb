class Admin::ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV.fetch('ADMIN_NAME'), password: ENV.fetch('ADMIN_PASSWORD')
    
  layout 'admin/application'
end
