class Flight < ActiveRecord::Base
  attr_accessible :arrival_code, :departs_at, :departure_code, :distance, :number, :seats
  
  def bookable?
    self.seats > 0
  end
  
  def arrives_at
    self.departs_at + (self.distance / 8 * 60)
  end
  
end
