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

  # What is not smart about this is: we are looping over ALL the bookings,
  # also the past ones. In the future we wil learn to retreive from the database
  # where date is > today...
  def available?(checkin, checkout)
    bookings.each do |booking|
      if (booking.starts_at <= checkout) && (booking.ends_at >= checkin)
        return false
      end
    end

    true
  end

  def current_and_future_bookings
    today = Date.today
    bookings.where("starts_at >= ? OR ends_at >= ?", today, today)
  end

  def self.single_bedroom
    where(bedroom_count: 1)
  end

  def self.for_couples
    single_bedroom.where(accommodate: 2)
  end

  # --------------------
  # https://read.codaisseur.com/topics/day-14-sql-and-relations/articles/2-3-has-many

  # returns the room id's of bookings during a period (occupied rooms during that period)
  # .pluck means: SELECT room_id FROM bookings .........
  def self.booked_during(arrival, departure)
    Booking.during(arrival, departure).pluck(:room_id)
  end

  # returns all rooms with no bookings
  def self.available_during(arrival, departure)
    where.not(id: booked_during(arrival, departure))
  end



end
