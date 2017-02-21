class ArticlesController < ApplicationController

  #==== Filters ====================================================
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    if @article = Article.create(article_params)
      flash[:success] = "Your article has been created."
      redirect_to articles_path
    else
      flash.now[:alert] = "Your new article has not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Your article has been updated."
      redirect_to (article_path(@article))
    else
      flash.now[:alert] = "Your new article has not created"
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:image, :caption)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
