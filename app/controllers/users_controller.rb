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
