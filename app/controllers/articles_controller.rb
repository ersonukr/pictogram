class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to (article_path(@article))
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:image, :caption)
  end
end
