class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room
  before_create :set_check_in_times

  def self.during arrival, departure
    arrival = arrival.change(hour: 14, min: 00, sec: 00)
    departure = departure.change(hour: 11, min: 00, sec: 00)
    starts_before_ends_after(arrival, departure)
        .or( ends_during(arrival, departure) )
        .or(start_during(arrival,departure))
  end

  def self.starts_before_ends_after arrival, departure
    where('starts_at < ? AND ends_at > ?', arrival, departure)

  end

  def self.start_during arrival, departure
    where('starts_at > ? AND starts_at < ?', arrival, departure)
  end

  def self.ends_during arrival, departure
    where('ends_at > ? AND ends_at > ?', departure, arrival)
  end

  private
  def set_check_in_times
    self.starts_at = starts_at.change(hour: 14, min: 00, sec: 00)
    self.ends_at = ends_at.change(hour: 11, min: 00, sec: 00)
  end

end
