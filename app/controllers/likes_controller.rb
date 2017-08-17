class LikesController < ApplicationController
    def create
        secret = Secret.find(params['secret_id'])
        like = Like.new
        like.user = current_user
        like.secret = secret
        like.save
        return redirect_to :back
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        return redirect_to :back
    end
end
