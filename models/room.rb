class Room
  attr_accessor :id
  attr_reader :patients
  # STATE
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @id = attributes[:id]
    @patients = attributes[:patients] || []
  end
  
  # BEHAVIOR
  def full?
    @patients.length == @capacity
  end

  def add_patient(patient)
    if full?
      # custom errors
      raise StandardError, 'Room is full'
    else
      # add the patient to the room
      @patients << patient
      # add the room to the patient
      patient.room = self
    end
  end
end
