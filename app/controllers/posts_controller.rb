class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all
    if logged_in?
      @post  = current_user.posts.build
    end
  end

  def create
    @post.image.attach(params[:post][:image])
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to request.referer
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def show
  end

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
