class CommentsController < ApplicationController


  def new

  end

  def create
    flash[:success] = "Has comentado correctamente"
    @user = User.find(current_user.id)
    @post = Post.find(session[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id
    @comment.save
    redirect_to post_path(@post)

  end

  private
  def comment_params
    params.require(:session).permit(:content)

  end

end
