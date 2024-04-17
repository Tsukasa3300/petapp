class LikesController < ApplicationController
    def create
        @post = Post.find(params[:like][:post_id])
        if current_user.like(@post)
           redirect_to request.referrer, status: :see_other
           flash[:success] = "いいねをしました"
        end   
    end
         
    def destroy
        post = current_user.likes_posts.find(params[:post_id])
        current_user.unlike(post)
    end
end
