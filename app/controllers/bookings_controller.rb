class BookingsController < ApplicationController
  def index
    set_animal
    @bookings = @animal.bookings
  end

  def new
    set_user
    @booking = Booking.new
  end

  def create
    set_user
    set_animal
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.animal = @animal
    if @booking.save
      redirect_to animal_path(@animal)
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
    redirect_to animal_bookings_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :reason)
  end
end
