require 'csv'
require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    load_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def all
    @patients
  end

  private
  
  def load_csv
    # "Translating" CSV rows to RUBY objects
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      
      new_patient = Patient.new(row)
      @patients << new_patient

      
      # This whole process of transforming the CSV room_id 1 into a RUBY Room object
      # is called DESERIALIZATION
      # find the room of this patient
      room_id = row[:room_id].to_i
      room = @room_repository.find(room_id)
      # assign the room to the patient
      # assign the patient to the room
      room.add_patient(new_patient)

    end

    if @patients.empty?
      @next_id = 1
    else
      @next_id = @patients.last.id + 1
    end
  end

  def save_csv
    # To Be Done
  end
end

