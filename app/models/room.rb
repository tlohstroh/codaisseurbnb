class Room < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :themes
  has_many :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :address, presence: true

  scope :single_bedroom, -> { where(bedroom_count: 1) }
  scope :for_couples, -> { single_bedroom.where(accommodate: 2) }


  def bargain?
    price < 30
  end

  def self.order_by_price
    order(:price)
  end

  def available?(checkin, checkout)
    bookings.each do |booking|
      if (booking.starts_at <= checkout) && (booking.ends_at >= checkin)
        return false
      end
    end

    true
  end

end
