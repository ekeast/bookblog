class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:notice] = "Your comment wasn't posted!"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end



  def destroy
    @comment = @commentable.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully."
    else
      flash[:notice] = "Comment couldn't be deleted. Try again."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end
