class ComputeNextDaysSlots
  def initialize(start_date: Date.today, nb_of_days: 5)
    @days = [start_date]
    (nb_of_days - 1).times do |i|
      @days << @days.last.next_weekday
    end
  end

  def call
    @days.map do |day|
      {
        date: day,
        slots: ComputeDaySlots.new(bookings: day_bookings(day)).call
      }
    end
  end

  private

  def day_bookings(day)
    Booking.where(date: day.beginning_of_day..day.end_of_day)
  end
end