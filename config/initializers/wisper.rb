Rails.application.config.to_prepare do
  Wisper.subscribe(NewArticleEmailListener.new)
  Wisper.subscribe(NewCommentEmailListener.new)
  Wisper.clear if Rails.env.development? || Rails.env.test?
end