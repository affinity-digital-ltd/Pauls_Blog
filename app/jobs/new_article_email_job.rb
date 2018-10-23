class NewArticleEmailJob
  include Sidekiq::Worker
  
  def perform
    NewArticleEmail.call
  end
end