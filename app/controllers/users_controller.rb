class UsersController < ApplicationController
  def index
    @professionals = User.where.not(profession: nil)
    #.order(:profession)
    @markers = @professionals.geocoded.map do |profesional|
      {
        lat: profesional.latitude,
        lng: profesional.longitude
      }
    end
  end

  def show
    @professional = User.find(params[:id])
    @bookings = @professional.bookings
  end
end
