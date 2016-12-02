class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
    @themes = @room.themes
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      image_params.each do |image|
        @room.photos.create(image: image)
      end

      redirect_to edit_room_path(@room), notice: "Room successfully created"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @room.update(room_params)
      image_params.each do |image|
        @room.photos.create(image: image)
      end

      redirect_to edit_room_path(@room), notice: "Room successfully updated"
    else
      render :edit
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  # We need to update the room_params method in the RoomsController to allow theme ids to be mass-assigned.
  # Because we're dealing with an array, we have to set the theme_ids key to an empty array.
  # https://read.codaisseur.com/topics/day-9-activerecord-fabaaa88-1830-4371-a3d4-bd7e21352ac4/articles/05-many-to-many
  # def room_params
  # params.require(:room).permit(..., theme_ids: [])
  # end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bedroom_count, :bathroom_count, :listing_name, :description, :address, :has_tv, :has_kitchen, :has_airco, :has_heating, :has_internet, :price, :active, theme_ids: [])
  end

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

end
