class MatchesController < ApplicationController
  def index
    @matches = Match.where(flatmate: current_user).or(Match.where(host: current_user))
  end
end
