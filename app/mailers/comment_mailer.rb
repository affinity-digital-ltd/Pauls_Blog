class CommentMailer < ActionMailer::Base
  default to: 'paul@paulbrighton.com',
          from: 'paul@paulbrighton.com'

  def contact
    @article = Article.find(params[:article_id])
    mail(subject: "A new comment has been posted on an article")
  end
end