class Flight < ActiveRecord::Base
  attr_accessible :arrival_code, :departs_at, :departure_code, :distance, :number
end
