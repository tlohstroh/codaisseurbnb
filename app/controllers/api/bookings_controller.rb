class Api::BookingsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :set_room

  def create
    total_price = get_total_price(booking_params)
    booking = @room.bookings.new(booking_params.merge(total: total_price))

    if booking.save
      render status: 200, json: {
          message: "Booking successfully created",
          room: @room,
          booking: booking
      }.to_json
    else
      render status: 422, json: {
          message: "Booking could not be created",
          errors: booking.errors
      }.to_json
    end
  end



  # ***********



  def update
    total_price = get_total_price(booking_params)
    booking = @room.bookings.find(params[:id])

    if booking.update(booking_params.merge(total: total_price))
      render status: 200, json: {
          message: "Booking successfully updated",
          room: @room,
          booking: booking
      }.to_json
    else
      render status: 422, json: {
          message: "Booking could not be updated",
          errors: booking.errors
      }.to_json
    end
  end


  # **********

  def destroy
    booking = @room.bookings.find(params[:id])
    booking.destroy

    render status: 200, json: {
        message: "Booking successfully deleted",
        room: @room,
        booking: booking
    }.to_json
  end

  # *********


  private

  def get_total_price(booking_params)
    checkin = DateTime.parse(booking_params[:starts_at])
    checkout = DateTime.parse(booking_params[:ends_at])

    total_days = (checkout - checkin).to_i
    booking_params[:price].to_i * total_days
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :price)
  end
end
