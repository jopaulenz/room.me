class HostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @host = Host.find(params[:id])
    @step = params[:step].to_i || 1
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    @host.user = current_user
    @host.save
    redirect_to edit2_path(@host)
  end

  # def edit
  #   @host = Host.find(params[:id])
  # end

  # def update
  #   @host = Host.find(params[:id])

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
    params.require(:host).permit(:name, :description, :city, :district, :user_id)
  end

  def step1_params
    params.require(:host).permit(:first_name, :last_name, :date_of_birth, :gender, :pronouns, :email_address, :phone_number)
  end

  def step2_params
    params.require(:host).permit(:city, :district, :rent, :entry_date, :duration, :registration)
  end

  def step3_params
    params.require(:host).permit(:room_size, :furnished)
  end

  def host_params
    params.require(:host).permit(:name, :city, :user_id)
  end

end
