class DislikesController < ApplicationController
  before_action :set_dislikable

  def create
    @dislike = Dislike.new(disliker: current_user, disliked: @dislikable)

    if @dislike.save
      redirect_back fallback_location: root_path, notice: 'User disliked successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Unable to dislike.'
    end
  end

  def destroy
    @dislike = Dislike.find_by(disliker: current_user, disliked: @dislikable)

    if @dislike
      @dislike.destroy
      redirect_back fallback_location: root_path, notice: 'Dislike removed successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Unable to remove dislike.'
    end
  end

  private

  def set_dislikable
    @dislikable = find_dislikable
  end

  def find_dislikable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
