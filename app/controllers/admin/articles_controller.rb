class Admin::ArticlesController < Admin::ApplicationController
  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save(article_params)
      flash[:notice] = "You successfully created a post."
      redirect_to admin_articles_path
    else
      flash[:notice] = "Error, please try again."
      render :new
    end
  end

  def index
    @articles = Article.all 
  end

  def edit
  end

  def update
    
    if @article.update(article_params)
      flash[:notice] = "You successfully updated a post."
      redirect_to admin_articles_path
    else
      flash[:notice] = "Error, please try again."
      render :edit
    end
  end

  def destroy
    @article.destroy
  
    redirect_to admin_articles_path, notice: "Post deleted."
  end

  private 
  def article_params 
    params.require(:article).permit(:title, :author, :text)
  end
end

private
  def load_article
    @article = Article.find(params[:id])
  end