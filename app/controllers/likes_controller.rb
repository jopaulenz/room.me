class LikesController < ApplicationController
  before_action :set_likable

  def create
    # Erstellt ein Like für den aktuellen User Big if statement here if I am a host then this and that.

    if current_user.host?
      profile = current_user.host
      @likable = Flatmate.find(params[:flatmate_id])
    else
      profile = current_user.flatmate
      @likable = Host.find(params[:host_id])
    end

    @like = Like.new(liker: profile, liked: @likable)

    if @like.save
      # Überprüfen, ob es ein Match gibt
      if match_exists?(@like)
        if create_match(@like)
          redirect_to matched_path, notice: 'It’s a match!'
        else
          redirect_back fallback_location: root_path, notice: 'It’s a match!'
        end
      else
        redirect_back fallback_location: root_path, notice: 'Like saved successfully.'
      end
    else
      redirect_back fallback_location: root_path, alert: 'Unable to like.'
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
    # Überprüft, ob das Gegenstück des Likes existiert
    Like.exists?(liker: like.liked, liked: like.liker)
  end

  def create_match(like)
    if like.liker.user.host?
      Match.create(host: like.liker, flatmate: like.liked)
    else
      Match.create(flatmate: like.liker, host: like.liked)
    end
  end
end
