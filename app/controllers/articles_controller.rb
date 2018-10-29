class ArticlesController < ApplicationController
  def show
    @article = Article.includes(:comments).find(params[:id])
    
    @comment = Comment.new
  end

  def index
    @articles = Article.newest

    @featured_article = Article.featured
  end
end

