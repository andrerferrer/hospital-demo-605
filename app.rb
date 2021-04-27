require_relative 'repositories/room_repository'
require_relative 'repositories/patient_repository'

room_repo = RoomRepository.new('database/rooms.csv')
patient_repo = PatientRepository.new('database/patients.csv', room_repo)

# vojtech doesn't have an id
vojtech = Patient.new(name: 'Vojtech')
patient_repo.add_patient(vojtech)
# now vojtech has an id

puts "\npatient_repo ="
p patient_repo
puts "\npatient_repo.all ="
p patient_repo.all
puts "\npatient_repo.all.first ="
p patient_repo.all.first
puts "\npatient_repo.all.first.room ="
p patient_repo.all.first.room
