class Admin::UsersController < ApplicationController
  http_basic_authenticate_with :name => "user", :password => "password"
end
