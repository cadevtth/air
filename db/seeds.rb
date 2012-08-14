if Rails.env.development?
  
  Time.zone = "America/Chicago"
  
  Airport.destroy_all
  Flight.destroy_all
  User.destroy_all
  Reservation.destroy_all
  
  airports = [
    {:city => "Chicago", :code => 'ORD'},
    {:city => "New York", :code => 'JFK'},
    {:city => "Boston", :code => 'BOS'},
    {:city => "Los Angeles", :code => 'LAX'}
  ]
  
  airports.each do |airport|
    Airport.create airport
  end

  puts 'Creating flights.'  
  100.times do 
    departure_airport, arrival_airport = Airport.all.sample(2)
    departure_time = rand(8..20)
    flight_number = rand(100..999)

    # Now we can generate a new flight using the random departure time
    # Maybe something like the code below:
    #
    number_of_seats = rand(0..60)
    if rand(0..3) == 0
      number_of_seats = 0
    end
    
    Flight.create :number => flight_number,
                  :departure_airport_id => departure_airport.id, 
                  :arrival_airport_id => arrival_airport.id,
                  :departs_at => (Date.today + departure_time.hours),
                  :distance => MileageCalculator.new(departure_airport.code, arrival_airport.code).miles,
                  :seats => number_of_seats
  end
  
  # attr_accessible :email, :name, :password, :password_confirmation
  
  puts 'Creating users.'
  10.times do |i|
    User.create :email => "user#{i}@gmail.com",
                :name => "First#{i} Last#{i}",
                :password => 'test',
                :password_confirmation => 'test'
  end
  
  puts 'Creating reservations.'
  User.all.each do |user|
    Flight.all.sample(rand(5)).each do |flight|
      
      # r = Reservation.new
      # r.user_id = user.id
      # r.flight_id = flight.id
      # r.departs_on = Date.today + rand(180)
      # r.card_number = (4444000000000000 + rand(1000000000000)).to_s
      # r.save
      
      user.reservations.create :departs_on => Date.today + rand(180),
                               :card_number => (4444000000000000 + rand(1000000000000)).to_s,                         
                               :flight_id => flight.id
    end
  end
  
end