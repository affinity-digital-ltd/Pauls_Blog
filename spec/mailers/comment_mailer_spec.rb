require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  let!(:mail) { 
    article = create(:article, title: "New Comment") 
    CommentMailer.with(article_id: article.id).contact
  }

  it "should render email headers" do
    expect(mail.subject).to eq("A new comment has been posted on an article")
    expect(mail.to).to eq(["paul@paulbrighton.com"])
    expect(mail.from).to eq(["paul@paulbrighton.com"])
  end

  it "should have email content" do
    expect(mail.body.encoded).to match("New comments have been posted on article New Comment")
  end
end