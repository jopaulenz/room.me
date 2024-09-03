class MatchesController < ApplicationController
  def index
    @matches = Match.where(flatmate: current_user.flatmate).or(Match.where(host: current_user.host))
  end

  def chats
    @matches = Match.where(flatmate: current_user.flatmate).or(Match.where(host: current_user.host))
  end
end
# a method called index
# inside this method i want the same code as in the chat because i need all the matches
# if i m a host i want to see the profile pic and as a flatmate the room picture
# as flatmate or host i want to see the name age i got matched with
# structure is the same in both views just different informations
# all the cards are gonna be clickable and have link_to
# to display the image in the view i need to refer to the methods in the match model
# iterate over matches in the index hmtl
