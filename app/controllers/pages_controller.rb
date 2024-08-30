class PagesController < ApplicationController
  def home
  end
  def tutorial
  end
  def welcome
    @flatmate = Flatmate.find(params[:id])
  end
end
