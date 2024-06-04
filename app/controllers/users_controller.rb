class UsersController < ApplicationController
  def index
    @professionals = User.where.not(profession: nil)
    #.order(:profession)
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end
end
