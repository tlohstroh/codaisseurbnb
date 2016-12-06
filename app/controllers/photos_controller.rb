# class PhotosController < ApplicationController
#   def destroy
#     @photo = Photo.find(params[:id])
#     @room = @photo.room
#
#     @photo.destroy
#
#     redirect_to edit_room_path(@room), notice: "Photo successfully removed"
#   end
# end

class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room

    @photo.destroy!
    @photos = Photo.where(room_id: @room.id)

    respond_to do |format|
      format.html { redirect_to room_path(@room) }
      format.js
    end
  end
end
