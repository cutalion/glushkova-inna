class Admin::ApplicationController < ::ApplicationController
  layout 'admin'
  http_basic_authenticate_with :name => ENV['ADMIN_LOGIN'], :password => ENV['ADMIN_PASSWORD']
end
