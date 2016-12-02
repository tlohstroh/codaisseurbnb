class RoomSerializer < ActiveModel::Serializer
  attributes :home_type, :room_type, :accommodate, :bedroom_count, :bathroom_count, :listing_name, :description, :address, :has_tv, :has_kitchen, :has_airco, :has_heating, :has_internet, :price

  has_many :bookings
end
