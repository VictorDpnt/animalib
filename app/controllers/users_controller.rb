class UsersController < ApplicationController
  def index
    @professionals = User.where.not(profession: nil)
    #.order(:profession)
    if params[:query].present?
      sql_subquery = <<~SQL
        users.first_name ILIKE :query
        OR users.last_name ILIKE :query
        OR users.address ILIKE :query
        OR users.profession ILIKE :query
      SQL
      @professionals = @professionals.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end
end
