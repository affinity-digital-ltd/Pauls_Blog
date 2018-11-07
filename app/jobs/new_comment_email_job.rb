class NewCommentEmailJob
  include Sidekiq::Worker
  
  def perform(article_id)
    NewCommentEmail.call(article_id)
  end
end