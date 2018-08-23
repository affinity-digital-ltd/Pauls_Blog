class Admin::ArticlesController < Admin::ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save(article_params)
      flash[:notice] = "You successfully created a post."
      redirect_to @article
    else
      flash[:notice] = "Error, please try again."
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    
    @article.comments.build
  end

  def index
    @articles = Article.all 
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "You successfully updated a post."
      redirect_to admin_articles_path
    else
      flash[:notice] = "Error, please try again."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path, notice: "Post deleted."
  end

  private 
  def article_params 
    params.require(:article).permit(:title, :author, :text)
  end
end

