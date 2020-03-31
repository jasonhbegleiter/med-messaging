# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying all previous users...'
if !User.all.empty?
  User.all.each do |u|
    User.destroy(u.id)
  end
end

puts "Creating 2 new users..."

usr1 = User.create!(email: 'user1@email.com', phone_number: '123-456-7890',first_name: 'User1', last_name: 'LName')
usr2 = User.create!(email: 'user2@email.com', phone_number: '223-456-7890',first_name: 'User2', last_name: 'LName')

puts "New users created"

puts "Creating 5 new products..."

prod1 = Product.create!(name: 'Liquid Gels', medium_type: 'Capsule', unit: 1, company: 'Advil')
prod2 = Product.create!(name: 'Fast Acting Pain Relief', medium_type: 'Tablet', unit: 0.25, company: 'Tylenol')
prod3 = Product.create!(name: 'Fast Vitamin C', medium_type: 'Scoop', unit: 1.0, company: 'BioReference')
prod4 = Product.create!(name: 'DigestPro', medium_type: 'Tablet', unit: 0.5, company: 'OrthoHelp')
prod5 = Product.create!(name: 'Tumeric', medium_type: 'Capsule', unit: 1, company: 'ReliefPro')

puts "New products created"

puts "Creating 4 new Rxs"

rx1 = Prescription.create!(user: usr1, product: prod1, amount: 1, instructions: "Take with water", start_date: Date.new(2020,3,20), end_date: Date.new(2020,4,4), active: true)
rx2 = Prescription.create!(user: usr1, product: prod2, amount: 2, instructions: "Take on empty stomach", start_date: Date.new(2020,3,21), end_date: Date.new(2020,4,5), active: false)
rx3 = Prescription.create!(user: usr2, product: prod2, amount: 3, instructions: "Drink with OJ", start_date: Date.new(2020,3,22), end_date: Date.new(2020,4,6), active: true)
rx4 = Prescription.create!(user: usr2, product: prod3, amount: 1.5, instructions: "No exercise for 2 hours", start_date: Date.new(2020,3,23), end_date: Date.new(2020,4,7), active: true)

puts "Rxs Created"

puts "Creating 12 new Rx Schedules..."

rxs1 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '08:00', as_needed: false )
rxs2 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '08:00', as_needed: false )
rxs3 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'mon,tue,wed,thu,fri', time_of_day: '09:00', as_needed: true )
rxs4 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '09:00', as_needed: false )
rxs5 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'mon,tue,wed,thu,fri', time_of_day: '12:00', as_needed: false )
rxs6 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'mon,wed,fri,sun', time_of_day: '12:00', as_needed: false )
rxs7 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'mon,wed,fri,sun', time_of_day: '14:00', as_needed: true )
rxs8 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '14:00', as_needed: false )
rxs9 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '16:00', as_needed: false )
rxs10 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '16:00', as_needed: false )
rxs11 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '20:00', as_needed: false )
rxs12 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'mon,tue,wed,thu,fri,sat,sun', time_of_day: '20:00', as_needed: false )

puts "Rx Schedules Created"

puts "Creating 25 Check Ins"

ci1 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'complete', scheduled_date: Date.new(2020,03,31), scheduled_time: '08:00')
ci2 = CheckIn.create!(prescription_schedule: rxs2, requirement_type: 'required', status: 'missed', scheduled_date: Date.new(2020,03,31), scheduled_time: '08:00')
ci3 = CheckIn.create!(prescription_schedule: rxs3, requirement_type: 'required', status: 'complete', scheduled_date: Date.new(2020,03,31), scheduled_time: '09:00')
ci4 = CheckIn.create!(prescription_schedule: rxs4, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '09:00')
ci5 = CheckIn.create!(prescription_schedule: rxs5, requirement_type: 'as_needed', status: 'complete', scheduled_date: Date.new(2020,03,31), scheduled_time: '12:00')
ci6 = CheckIn.create!(prescription_schedule: rxs6, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '12:00')
ci7 = CheckIn.create!(prescription_schedule: rxs7, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '12:00')
ci8 = CheckIn.create!(prescription_schedule: rxs8, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '12:00')
ci9 = CheckIn.create!(prescription_schedule: rxs9, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '18:00')
ci10 = CheckIn.create!(prescription_schedule: rxs10, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '18:00')
ci11 = CheckIn.create!(prescription_schedule: rxs11, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '18:00')
ci12 = CheckIn.create!(prescription_schedule: rxs12, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,03,31), scheduled_time: '18:00')
ci13 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci14 = CheckIn.create!(prescription_schedule: rxs2, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci15 = CheckIn.create!(prescription_schedule: rxs3, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci16 = CheckIn.create!(prescription_schedule: rxs4, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci17 = CheckIn.create!(prescription_schedule: rxs5, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci18 = CheckIn.create!(prescription_schedule: rxs6, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci19 = CheckIn.create!(prescription_schedule: rxs7, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci20 = CheckIn.create!(prescription_schedule: rxs8, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci21 = CheckIn.create!(prescription_schedule: rxs9, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,04,01), scheduled_time: '08:00')
ci22 = CheckIn.create!(prescription_schedule: rxs10, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,03), scheduled_time: '08:00')
ci23 = CheckIn.create!(prescription_schedule: rxs11, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,03), scheduled_time: '08:00')
ci24 = CheckIn.create!(prescription_schedule: rxs12, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,03), scheduled_time: '08:00')
ci25 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,03), scheduled_time: '08:00')

puts "Checkins Created"
