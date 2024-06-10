class UsersController < ApplicationController
  def index
    # @professionals = User.where.not(profession: nil)
    @professionals = User.includes(:bookings, photo_attachment: :blob).where.not(profession: nil)

    if params[:query].present?
      sql_subquery = <<~SQL
        users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @professionals = @professionals.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:address].present?
      @professionals = @professionals.where("users.address ILIKE ?", "%#{params[:address]}%")
      # @professionals_located = @professionals
    end

    if params[:profession].present?
      @professionals = @professionals.where("users.profession ILIKE ?", "%#{params[:profession]}%")
    end

    @markers = @professionals.geocoded.map do |professional|
      {
        lat: professional.latitude,
        lng: professional.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { professional: professional })
      }
    end
  end

  def show
    @professional = User.find(params[:id])
    @slots = ComputeNextDaysSlots.new(user: @professional).call
    # @bookings = @professional.bookings
    if @professional.present?
      @markers = [
        {
          lat: @professional.latitude,
          lng: @professional.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { professional: @professional })
        }
      ]
    end
  end
end
