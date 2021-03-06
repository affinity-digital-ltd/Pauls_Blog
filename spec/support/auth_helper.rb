module AuthHelper
  def http_login
    username = ENV.fetch('ADMIN_NAME')
    password = ENV.fetch('ADMIN_PASSWORD')

    if page.driver.browser.respond_to?(:authorize)
      # When headless
      page.driver.browser.authorize(username, password)
    else
      # When javascript test
      visit "http://#{username}:#{password}@#{ Capybara.current_session.server.host }:#{ Capybara.current_session.server.port }/admin"
    end
  end
end    
