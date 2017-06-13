class PostsController < ApplicationController

  def index
    @post = Post.all
   sacar_caracteres(@post)



  end
  def new

  @post = Post.new
  end


  def create

    @user = User.find(current_user.id)
    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success] = "Tu Post se ha creado correctamente"

      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show

    @post = Post.find(params[:id])
    post_id(@post)
    @comment = @post.comments

  end

  def update
  @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Tu Post se ha editado correctamente"
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def edit
    @post = Post.find(params[:id])

  end
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post borrado correctamente"
    redirect_to root_path

  end

  private
  def post_params
    params.require(:post).permit(:tittle, :content)
  end
end
