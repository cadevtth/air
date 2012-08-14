class Flight < ActiveRecord::Base
  attr_accessible :arrival_code, :departs_at, :departure_code, :distance, :number, :seats, :airport_id, :departure_airport_id, :arrival_airport_id
  
  belongs_to :departure_airport, :class_name => 'Airport'
  belongs_to :arrival_airport, :class_name => 'Airport'
  
  def bookable?
    self.seats > 0
  end
  
  def for_display
    "#{self.number} #{self.departure_code} to #{self.arrival_code}"
  end
  
  def arrives_at
    self.departs_at + (self.distance / 8 * 60)
  end
  
end
