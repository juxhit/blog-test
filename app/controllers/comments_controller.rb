class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :author_id, :published_at)
    end
end
