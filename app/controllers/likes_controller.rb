class LikesController < ApplicationController
  before_action :set_likable

  def create
    if current_user.host?
      profile = current_user.host
      @likable = Flatmate.find(params[:flatmate_id])
    else
      profile = current_user.flatmate
      @likable = Host.find(params[:host_id])
    end

    @like = Like.new(liker: profile, liked: @likable)

    if @like.save
      if match_exists?(@like)
        if create_match(@like)
          redirect_to matched_path, notice: 'It’s a match!'
        else
          redirect_back fallback_location: matches_path, notice: "You've already matched with this user!"
        end
      else
        redirect_to next_suggested_path, notice: 'Like saved successfully.'
      end
    else
      redirect_to next_suggested_path
    end
  end

  def destroy
    @like = Like.find_by(liker: current_user, liked: @likable)

    if @like
      @like.destroy
      redirect_back fallback_location: root_path, notice: 'Like removed successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Unable to remove like.'
    end
  end

  private

  def set_likable
    @likable = find_likable
  end

  def find_likable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def match_exists?(like)
    # Check if a reciprocal like exists
    Like.exists?(liker: like.liked, liked: like.liker)
  end

  def create_match(like)
    if like.liker.user.host?
      Match.create(host: like.liker, flatmate: like.liked)
    else
      Match.create(flatmate: like.liker, host: like.liked)
    end
  end

  def next_suggested_path
    if current_user.host?
      # Host sees next suggested flatmate
      next_flatmate = current_user.host.suggested_flatmates.find do |flatmate|
        !current_user.host.received_likes.exists?(liked: flatmate)
      end
      next_flatmate.present? ? flatmate_path(next_flatmate) : host_path(Host.last)
    else
      # Flatmate sees next suggested host
      next_host = current_user.flatmate.suggested_hosts.find do |host|
        !current_user.flatmate.given_likes.exists?(liked: host)
      end
      next_host.present? ? host_path(next_host) : host_path(Host.last)
    end
  end
end
