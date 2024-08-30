class HostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hosts = Host.includes(:living_preference).all
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    @host.user = current_user
    @host.save!
    redirect_to host_edit2_path(@host)
  end

  def edit2
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if  @host.update!(host_params)
      redirect_to params[:step] == "3" ? tutorial_path : host_edit3_path(@host)
     else
      render params[:step] == "2" ? :edit2 : :edit3
     end
    end

    def edit3
      @host = Host.find(params[:id])
    end

    def show
      @host = Host.find(params[:id])
    end

  #   if @host.update(host_params)
  #     redirect_to @host, notice: 'Your host profile was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @host = Host.find(params[:id])
  #   @host.destroy
  #   redirect_to hosts_path, notice: 'Your host profile was successfully deleted.'
  # end

  private

  def host_params
    params.require(:host).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number,
    :city, :district, :rent, :entry_date, :duration, :registration, :room_size, :furnished, :street, :postcode, :country)
  end

end
