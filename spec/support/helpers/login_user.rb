module LoginUser
  def log_in
    page.set_rack_session(userinfo: { "info" => { "name" => "Paul"}})
  end
end