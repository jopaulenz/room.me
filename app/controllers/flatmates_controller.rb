class FlatmatesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.host?
      @suggested_flatmates = current_user.host.suggested_flatmates
    else
      redirect_to root_path, alert: "Only hosts can see this page."
    end
  end

  def like
    @host = Host.find(params[:id])
    current_user.flatmate.given_likes.create!(liked: @host)
    redirect_to hosts_path # Zeige den nächsten Host nach Like
  end

  def dislike
    @host = Host.find(params[:id])
    # Logik für Dislike, wenn nötig (optional)
    redirect_to hosts_path # Zeige den nächsten Host nach Dislike
  end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(step1_params)
    @flatmate.user = current_user
    if @flatmate.save
      redirect_to flatmate_edit2_path(@flatmate)
    else
      render :new
    end
  end

  def edit2
    @flatmate = Flatmate.find(params[:id])
  end

  def update
    @flatmate = Flatmate.find(params[:id])
    if @flatmate.update(flatmate_params)
      redirect_to params[:step] == "3" ? tutorial_path : flatmate_edit3_path(@flatmate)
    else
      render params[:step] == "2" ? :edit2 : :edit3
    end
  end

  def edit3
    @flatmate = Flatmate.find(params[:id])
  end

  def show
    @flatmate = Flatmate.find(params[:id])
  end

  private

  def step1_params
    params.require(:flatmate).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number)
  end

  def edit2_params
    params.require(:flatmate).permit(:city, :district, :rent_min, :rent_max, :entry_date, :duration, :registration)
  end

  def edit3_params
    params.require(:flatmate).permit(:room_size_min, :room_size_max, :flatmates_min, :flatmates_max, :furnished)
  end

  def flatmate_params
    params.require(:flatmate).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number,
                                     :city, :district, :rent_min, :rent_max, :entry_date, :duration, :registration, :room_size_min, :room_size_max, :furnished, :profile_photo)
  end
end
