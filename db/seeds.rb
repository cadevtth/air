if Rails.env.development?
  
  Time.zone = "America/Chicago"
  
  Flight.destroy_all
  User.destroy_all
  Reservation.destroy_all
  
  codes = ['ORD', 'JFK', 'BOS', 'LAX']

  puts 'Creating flights.'  
  10.times do 
    departure_code, arrival_code = codes.sample(2)
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
                  :departure_code => departure_code, 
                  :arrival_code => arrival_code,
                  :departs_at => (Date.today + departure_time.hours),
                  :distance => MileageCalculator.new(departure_code, arrival_code).miles,
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