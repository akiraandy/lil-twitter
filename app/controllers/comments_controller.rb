class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    @comment.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Tweet.find_by_id(params[:tweet_id]) if params[:tweet_id]
  end
end
