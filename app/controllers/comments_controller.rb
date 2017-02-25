class CommentsController < ApplicationController

  #==== Filters ====================================================
  before_action :set_article

  def index
    @comments = @article.comments.order("created_at ASC")
    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Something went wrong, Please try again !"
      render root_path
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
