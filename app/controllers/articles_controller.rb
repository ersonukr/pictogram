class ArticlesController < ApplicationController

  #==== Filters ====================================================
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all.order('created_at DESC').page params[:page]
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
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

  def like
    if @article.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:image, :caption)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def owned_article
    unless current_user == @article.user
      flash[:alert] = "That article doesn't belong to you!"
      redirect_to root_path
    end
  end

end
