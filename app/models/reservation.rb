class Reservation < ActiveRecord::Base
  attr_accessible :card_number, :departs_on, :flight_id, :user_id
  
  belongs_to :flight
  belongs_to :user
  
  before_validation :sanitize_card_number
  
  validates :card_number, :format => { :with => /^4/ }
  
  after_create :increase_miles_earned
  
  def sanitize_card_number
    self.card_number.strip!
  end
  
  def increase_miles_earned
    self.user.miles_earned += flight.distance
    self.user.save
  end
  
end






