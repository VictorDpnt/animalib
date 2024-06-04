class BookingsController < ApplicationController
  def index
    @animal = Animal.find(params[:animal_id])
    @bookings = @animal.bookings
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to animal_path(@animal)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to animal_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
