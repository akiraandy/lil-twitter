class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update(comment_params)
      redirect_to tweets_path
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.update(body: "**Comment deleted**")
    redirect_to tweets_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Tweet.find_by_id(params[:tweet_id]) if params[:tweet_id]
  end
end
