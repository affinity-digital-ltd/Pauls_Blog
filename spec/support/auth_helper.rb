module AuthHelper
  def http_login
    username = 'user'
    password = 'password'
    if page.driver.browser.respond_to?(:authorize)
      # When headless
      page.driver.browser.authorize(username, password)
    else
      # When javascript test
      visit "http://#{username}:#{password}@#{host}:#{port}/"     
     end
  end
end