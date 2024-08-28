class FlatmatesController < ApplicationController
  before_action :authenticate_user!

  # def show
  #   @flatmate = Flatmate.find(params[:id])
  # end

  def new
    @flatmate = Flatmate.new
  end

  def create
    @flatmate = Flatmate.new(flatmate_params)
    @flatmate.user = current_user

    if @flatmate.save
      redirect_to @flatmate, notice: 'Your flatmate profile was successfully created.'
    else
      render :new
    end
  end

#   def edit
#     @flatmate = Flatmate.find(params[:id])
#   end

#   def update
#     @flatmate = Flatmate.find(params[:id])

#     if @flatmate.update(flatmate_params)
#       redirect_to @flatmate, notice: 'Your flatmate profile was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @flatmate = Flatmate.find(params[:id])
#     @flatmate.destroy
#     redirect_to flatmates_path, notice: 'Your flatmate profile was successfully deleted.'
#   end

  private

  def flatmate_params
    params.require(:flatmate).permit(:name, :city, :user_id) #
  end
end

