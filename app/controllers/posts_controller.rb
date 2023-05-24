class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:index, :destroy, :create]
  
  def index
    @posts = current_user.posts.order(created_at: :desc)
    if logged_in?
      @post  = current_user.posts.build
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to request.referer
    else
      flash[:danger] = "投稿内容を入力してください"
      redirect_to request.referrer, status: :see_other
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def show
  end

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @post.nil?
  end
end
