class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to @post
    else
      flash[:danger] = "There was an error saving your comment."
      redirect_to @post
    end
  end

  def destroy

  end


  private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

end
