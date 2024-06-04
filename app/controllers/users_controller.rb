class UsersController < ApplicationController
  def index
    @users = User.where(profession: nil)
    @professionals = User.where.not(profession: nil)
    #.order(:profession)
  end

  def show
    @user = User.find(params[:id])
    @user.booking = @booking
  end
end
