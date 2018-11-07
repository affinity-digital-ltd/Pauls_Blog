class NewCommentEmail
  attr_accessor :article_id

  def self.call(article_id)
    new(article_id).call
  end

  def initialize(article_id)
    self.article_id = article_id
  end

  def call
    CommentMailer.with(article_id: article_id).contact.deliver_now
  end
end