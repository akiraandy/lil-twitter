class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.save!
  end

  private

  def comment_params
    @comment.require(:comment).permit(:body)
  end
end
