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
    
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def index
    @articles = Article.all 
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    permitted_columns = params.require(:article).permit(:title, :text)
    @article.update_attributes(permitted_columns)

    redirect_to articles_path
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

