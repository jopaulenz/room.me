class HostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @host = Host.find(params[:id])
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    @host.user = current_user

    if @host.save
      redirect_to @host, notice: 'Your host profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])

    if @host.update(host_params)
      redirect_to @host, notice: 'Your host profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    redirect_to hosts_path, notice: 'Your host profile was successfully deleted.'
  end

  private

  def host_params
    params.require(:host).permit(:name, :description, :city, :district, :user_id)
  end
end

