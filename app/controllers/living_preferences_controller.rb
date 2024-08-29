class LivingPreferencesController < ApplicationController
  before_action :set_living_preference, only: [:edit, :update]

  def new
    @living_preference = LivingPreference.new
    @step = (params[:step] || 1).to_i
  end

  def create
    @living_preference = LivingPreference.new(living_preference_params)

    @living_preference.preferable = current_user.flatmate || current_user.host   # Setze das `preferable` auf den aktuellen Benutzer oder ein anderes Objekt

    @living_preference.instance_variable_set(:@current_step, params[:step].to_i)

    if @living_preference.save
      redirect_to edit_living_preference_path(@living_preference, step: 2), notice: 'Living preferences were successfully created.'
    else
      @step = params[:step].to_i
      puts "Fehler beim Speichern des LivingPreference-Objekts:"
      puts @living_preference.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @step = params[:step].to_i
    @step = 1 if @step < 1 || @step > 4  # Sicherstellen, dass der Schritt innerhalb der gültigen Bereiche liegt
    @living_preference.instance_variable_set(:@current_step, @step)
  end

  def update
    @step = params[:step].to_i
    @step = 1 if @step < 1 || @step > 4  # Sicherstellen, dass der Schritt innerhalb der gültigen Bereiche liegt
    @living_preference.instance_variable_set(:@current_step, @step)

    if @living_preference.update(living_preference_params)
      if @step < 4
        next_step = @step + 1
        redirect_to edit_living_preference_path(@living_preference, step: next_step), notice: 'Living preferences were successfully updated.'
      else
        redirect_to root_path, notice: 'Living preferences were successfully completed.'
      end
    else
      render :edit
    end
  end

  private

  def set_living_preference
    @living_preference = LivingPreference.find(params[:id])
  end

  def living_preference_params
    params.require(:living_preference).permit(
      :cleanliness, :gender, :smoking, :partying, :age,
      :furnished, :dishwasher, :washingmaschine, :balcony,
      :kitchen, :bathtub, :aboutme, :interest
    )
  end
end
