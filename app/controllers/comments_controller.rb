class CommentsController < ApplicationController
  def new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
  
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :new
    end
  end
  
  def comment_params
    params.require(:comment).permit(:author_name, :body, :image)
  end
end
