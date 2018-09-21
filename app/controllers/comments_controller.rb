class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
  end

  def create
    @comment = Comment.new(comment_params.merge(article_id: params[:article_id]))
    @article = @comment.article
  
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :new
    end
  end
  
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
