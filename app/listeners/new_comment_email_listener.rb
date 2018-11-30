class NewCommentEmailListener
  def initialize
  end

  def new_comment_email(article_id)
    NewCommentEmailJob.perform_async(article_id)
  end
end