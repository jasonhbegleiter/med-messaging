# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying all previous seeds...'
CheckIn.destroy_all
PrescriptionSchedule.destroy_all
Prescription.destroy_all
Product.destroy_all
User.destroy_all

######################################## Users ########################################
puts "Creating 2 new users..."

usr1 = User.create!(email: 'user1@email.com', phone_number: '972547171109',first_name: 'User1', last_name: 'LName', password: '123456', admin: true)
usr2 = User.create!(email: 'user2@email.com', phone_number: '16097035733',first_name: 'User2', last_name: 'LName', password: '123456')

puts "New users created!"

######################################## Products ########################################

puts "Creating 5 new products..."

prod1 = Product.create!(name: 'Liquid Gels', medium_type: 'Capsule', unit: 1, company: 'Advil')
prod2 = Product.create!(name: 'Fast Acting Pain Relief', medium_type: 'Tablet', unit: 0.25, company: 'Tylenol')
prod3 = Product.create!(name: 'Fast Vitamin C', medium_type: 'Scoop', unit: 1.0, company: 'BioReference')
prod4 = Product.create!(name: 'DigestPro', medium_type: 'Tablet', unit: 0.5, company: 'OrthoHelp')
prod5 = Product.create!(name: 'Tumeric', medium_type: 'Capsule', unit: 1, company: 'ReliefPro')

puts "New products created!"

######################################## Prescriptions ########################################

puts "Creating 4 new Rxs..."

rx1 = Prescription.create!(user: usr1, product: prod1, amount: 1, instructions: "Take with water", start_date: Date.new(2020,3,20), end_date: Date.new(2020,4,4), active: true)
rx2 = Prescription.create!(user: usr1, product: prod2, amount: 2, instructions: "Take on empty stomach", start_date: Date.new(2020,3,21), end_date: Date.new(2020,4,5), active: false)
rx3 = Prescription.create!(user: usr2, product: prod2, amount: 3, instructions: "Drink with OJ", start_date: Date.new(2020,3,22), end_date: Date.new(2020,4,6), active: true)
rx4 = Prescription.create!(user: usr2, product: prod3, amount: 1.5, instructions: "No exercise for 2 hours", start_date: Date.new(2020,3,23), end_date: Date.new(2020,4,7), active: true)

puts "Rxs created!"

######################################## Prescription Schedules ########################################


puts "Creating 12 new Rx Schedules..."

rxs1 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '08:00', as_needed: false )
rxs2 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '08:00', as_needed: false )
rxs3 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday', time_of_day: '09:00', as_needed: true )
rxs4 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '09:00', as_needed: false )
rxs5 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday', time_of_day: '12:00', as_needed: false )
rxs6 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'Monday,Wednesday,Friday,Sunday', time_of_day: '12:00', as_needed: false )
rxs7 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'Monday,Wednesday,Friday,Sunday', time_of_day: '14:00', as_needed: true )
rxs8 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '14:00', as_needed: false )
rxs9 = PrescriptionSchedule.create!(prescription: rx1, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '16:00', as_needed: false )
rxs10 = PrescriptionSchedule.create!(prescription: rx2, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '16:00', as_needed: false )
rxs11 = PrescriptionSchedule.create!(prescription: rx3, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '20:00', as_needed: false )
rxs12 = PrescriptionSchedule.create!(prescription: rx4, day_of_week: 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', time_of_day: '20:00', as_needed: false )

puts "Rx Schedules created!"

######################################## Check Ins ########################################

puts "Creating 25 Check Ins..."

ci1 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'complete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs1.time_of_day)
ci2 = CheckIn.create!(prescription_schedule: rxs2, requirement_type: 'required', status: 'missed', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs2.time_of_day)
ci3 = CheckIn.create!(prescription_schedule: rxs3, requirement_type: 'required', status: 'complete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs3.time_of_day)
ci4 = CheckIn.create!(prescription_schedule: rxs4, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs4.time_of_day)
ci5 = CheckIn.create!(prescription_schedule: rxs5, requirement_type: 'as_needed', status: 'complete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs5.time_of_day)
ci6 = CheckIn.create!(prescription_schedule: rxs6, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs6.time_of_day)
ci7 = CheckIn.create!(prescription_schedule: rxs7, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs7.time_of_day)
ci8 = CheckIn.create!(prescription_schedule: rxs8, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs8.time_of_day)
ci9 = CheckIn.create!(prescription_schedule: rxs9, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs9.time_of_day)
ci10 = CheckIn.create!(prescription_schedule: rxs10, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs10.time_of_day)
ci11 = CheckIn.create!(prescription_schedule: rxs11, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs11.time_of_day)
ci12 = CheckIn.create!(prescription_schedule: rxs12, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs12.time_of_day)
ci13 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs1.time_of_day)
ci14 = CheckIn.create!(prescription_schedule: rxs2, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs2.time_of_day)
ci15 = CheckIn.create!(prescription_schedule: rxs3, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs3.time_of_day)
ci16 = CheckIn.create!(prescription_schedule: rxs4, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs4.time_of_day)
ci17 = CheckIn.create!(prescription_schedule: rxs5, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs5.time_of_day)
ci18 = CheckIn.create!(prescription_schedule: rxs6, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs6.time_of_day)
ci19 = CheckIn.create!(prescription_schedule: rxs7, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs7.time_of_day)
ci20 = CheckIn.create!(prescription_schedule: rxs8, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs8.time_of_day)
ci21 = CheckIn.create!(prescription_schedule: rxs9, requirement_type: 'as_needed', status: 'incomplete', scheduled_date: Date.new(2020,04,04), scheduled_time: rxs9.time_of_day)
ci22 = CheckIn.create!(prescription_schedule: rxs10, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs10.time_of_day)
ci23 = CheckIn.create!(prescription_schedule: rxs11, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs11.time_of_day)
ci24 = CheckIn.create!(prescription_schedule: rxs12, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs12.time_of_day)
ci25 = CheckIn.create!(prescription_schedule: rxs1, requirement_type: 'required', status: 'incomplete', scheduled_date: Date.new(2020,04,05), scheduled_time: rxs1.time_of_day)

puts "Checkins created!"
