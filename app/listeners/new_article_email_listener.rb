class NewArticleEmailListener
  def initialize
  end

  def new_article_email
    NewArticleEmailJob.perform_async
  end
end