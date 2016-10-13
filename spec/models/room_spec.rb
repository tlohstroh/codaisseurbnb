require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "validations" do
    it "is invalid without a home type" do
      room = Room.new(home_type: "")
      room.valid?
      expect(room.errors).to have_key(:home_type)
    end
  end

    # it "is invalid without a room type"
    # it "is invalid with a listing name longer than 50 characters"
    # it "is invalid with a description longer than 500 characters"
    # it "is valid without a price"

  describe "#bargain?" do
    let(:user) { create :user }
    let(:bargain_room) { create :room, price: 20, user: user }
    let(:non_bargain_room) { create :room, price: 200, user: user }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_room.bargain?).to eq(true)
      expect(non_bargain_room.bargain?).to eq(false)
    end
  end

  describe "#order_by_price" do
    let!(:room1) { create :room, price: 100 }
    let!(:room2) { create :room, price: 200 }
    let!(:room3) { create :room, price: 300 }

    it "returns a sorted array o rooms by prices" do
      expect(Room.order_by_price).to match_array [room1, room2, room3]
    end
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      room = user.rooms.new(home_type: "Shared")

      expect(room.user).to eq(user)
    end
  end


end
