class Api::RoomsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    rooms = Room.all
    render status: 200, json: rooms
  end

  def show
    room = Room.find(params[:id])
    render status: 200, json: room
  end

  def create
    room = Room.new(room_params)

    if room.save
      render status: 200, json: {
        message: "Room successfully created",
        room: room
      }.to_json
    else
      render status: 422, json: {
        errors: room.errors
      }.to_json
    end
  end

  # def destroy
  #   room = Room.find(params[:id])
  #   room.destroy
  #
  #   render status: 200, json: {
  #       message: "Room successfully deleted"
  #   }.to_json
  # end
  #
  # def update
  #   room = Room.find(params[:id])
  #
  #   if room.update(room_params)
  #     render status: 200, json: room
  #   else
  #     render status: 500, json: {
  #         message: "The room could not be updated",
  #         errors: room.errors
  #     }.to_json
  #   end
  # end

  private

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bedroom_count, :bathroom_count, :listing_name, :description, :address, :has_tv, :has_kitchen, :has_airco, :has_heating, :has_internet, :price, :active, theme_ids: [])
  end
end
