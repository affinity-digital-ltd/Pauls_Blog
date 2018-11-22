class ArticlesController < ApplicationController
  after_action :set_return_url, only: :show

  def show
    @article = Article.includes(:comments).friendly.find(params[:id])

    
    @comment = Comment.new
  end

  def index
    @articles = Article.newest

    @featured_article = Article.featured
  end

  private

  def set_return_url
    session[:return_url] = article_url(@article)
  end
end

