class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      flash[:success] = "Comment posted!"
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def destroy

  end


  private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

end
