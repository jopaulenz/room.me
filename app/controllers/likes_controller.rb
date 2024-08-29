class LikesController < ApplicationController
  before_action :set_likable

  def create
    # Erstellt ein Like für den aktuellen User
    @like = Like.new(liker: current_user, liked: @likable)

    if @like.save
      # Überprüfen, ob es ein Match gibt
      if match_exists?(@like)
        create_match(@like)
        redirect_back fallback_location: root_path, notice: 'It’s a match!'
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
    Match.create(flatmate: like.liker, host: like.liked)
  end
end
