class Admin::ArticlesController < Admin::ApplicationController
  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.image.attach(article_params[:image])
    
    if @article.save
      redirect_to admin_articles_path, notice: "You successfully created a post."
    else
      flash[:alert] = "All fields are required."
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
      redirect_to admin_articles_path, notice: "You successfully updated your post."
    else
      flash[:alert] = "Please fill in all required fields."
      render :edit
    end
  end

  def destroy
    @article.destroy
  
    redirect_to admin_articles_path, notice: "Your post has been been deleted."
  end

  private 
  def article_params 
    params.require(:article).permit(:title, :author, :text, :image)
  end
end

private
  def load_article
    @article = Article.find(params[:id])
  end