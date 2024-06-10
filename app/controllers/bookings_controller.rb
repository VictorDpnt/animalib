class BookingsController < ApplicationController
  def index
    set_animal
    @bookings = @animal.bookings
  end

  # def new
  #   set_professional
  #   @booking = Booking.new(date: params[:date])
  #   @reasons = ["Follow-up consultation", "Vaccination", "Sterilization", "Digestive diseases", "Trauma", "Other"]
  # end

  def create
    set_professional
    @booking = Booking.new(booking_params)
    @booking.user = @professional
    if @booking.save
      redirect_to animal_health_records_path(@booking.animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    set_animal
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to animal_path(@animal)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_professional
    @professional = User.find(params[:user_id])
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def booking_params
    params.require(:booking).permit(:animal_id, :date, :reason)
  end
end
