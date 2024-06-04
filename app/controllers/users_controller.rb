class UsersController < ApplicationController
  def index
    @professionals = User.where.not(profession: nil)
    #.order(:profession)
  end

  def show
    @professional = User.find(params[:id])
    @bookings = @professional.bookings
  end
end
