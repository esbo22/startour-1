module ApplicationHelper
  def booking_status_class(booking)
    booking.status == 'confirmed' ? 'text-success' : 'text-danger'
  end
end
