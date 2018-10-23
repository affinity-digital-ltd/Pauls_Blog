Gibbon::Request.api_key = ENV.fetch('MAIL_CHIMP_API_KEY')
Gibbon::Request.timeout = 20
Gibbon::Request.open_timeout = 20
Gibbon::Request.symbolize_keys = true
Gibbon::Request.throws_exceptions = false