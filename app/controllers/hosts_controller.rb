class HostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hosts = Host.includes(:living_preference).all
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params_step1)
    @host.user = current_user
    if @host.save
      redirect_to host_edit2_path(@host)
    else
      render :new
    end
  end

  def edit2
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    case params[:step]
    when "2"
      if @host.update(host_params_step2)
        redirect_to host_edit3_path(@host)
      else
        render :edit2
      end
    when "3"
      if @host.update(host_params_step3)
        redirect_to tutorial_path
      else
        render :edit3
      end
    else
      redirect_to root_path, alert: "Invalid step"
    end
  end

  def edit3
    @host = Host.find(params[:id])
  end

  def show
    @host = Host.find(params[:id])
    @markers = [{
      lat: @host.latitude,
      lng: @host.longitude
    }]
  end

  private

  # Add profile_photo to params in whichever step you need it.

  def host_params_step1
    params.require(:host).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number)
  end

  def host_params_step2
    params.require(:host).permit(:city, :district, :rent, :entry_date)
  end

  def host_params_step3
    params.require(:host).permit(:duration, :registration, :room_size_min, :room_size_max, :furnished)
  end
end
