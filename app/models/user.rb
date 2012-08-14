class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  
  has_many :reservations
  has_many :flights, through: :reservations
  
  # def miles_earned
  #   self.flights.map { |flight| flight.distance }.inject(:+)
  # end
  
end
