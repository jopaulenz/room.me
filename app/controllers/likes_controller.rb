class LikesController < ApplicationController

  def create
    @like = Like.new
    @like.liker = current_user
    # @like.liked =
  end
end
