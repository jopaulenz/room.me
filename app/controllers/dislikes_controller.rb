class DislikesController < ApplicationController
  before_action :set_dislikable

  def create
    @dislike = Dislike.new(disliker: current_user, disliked: @dislikable)

    if @dislike.save
      redirect_to next_host_path, notice: 'User disliked successfully.'
    else
      redirect_to next_host_path, alert: 'Unable to dislike.'
    end
  end

  def destroy
    @dislike = Dislike.find_by(disliker: current_user, disliked: @dislikable)

    if @dislike
      @dislike.destroy
      redirect_to next_host_path, notice: 'Dislike removed successfully.'
    else
      redirect_to next_host_path, alert: 'Unable to remove dislike.'
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

  def next_host_path
    # Get a list of host IDs that the current flatmate has disliked, including the current host if disliked
    disliked_host_ids = current_user.flatmate.given_dislikes.where(disliked_type: 'Host').pluck(:disliked_id)

    # Add the current host's ID to the disliked_host_ids if it's not already in the list
    disliked_host_ids << @dislikable.id unless disliked_host_ids.include?(@dislikable.id)

    # Fetch the next host that hasn't been disliked yet and has an ID greater than the current host's ID
    next_host = Host.where("id > ?", @dislikable.id)
                    .where.not(id: disliked_host_ids)
                    .order(:id)
                    .first

    # Redirect to the next host if it exists, or to the hosts index if there are no more hosts
    next_host.present? ? host_path(next_host) : hosts_path(Host.last)
  end
end
