module CommentsHelper

  def post_id(post)

    session[:post_id] = post.id

  end




end
