class Patient
  attr_reader :name, :cured
  attr_accessor :room, :id
  
  # # reader
  # def room
  #   return @room
  # end

  # # writer
  # def room=(room)
  #   @room = room
  # end

  # STATE
  def initialize(attributes = {})
    @name = attributes[:name]
    @id = attributes[:id]

    @cured = attributes[:cured] || false

    # if attributes[:cured].nil?
    #   @cured = false
    # else
    #   @cured = attributes[:cured]
    # end
  end

  # BEHAVIOR
  def cure! # this method changes the object
    @cure = true
  end
end


# christian_data = {
#   name: 'Christian',
#   cured: false
# }
# christian = Patient.new(christian_data)
# andre = Patient.new({ name: 'Andre' })
# # short-hand syntax -> syntatic sugar
# lisa = Patient.new( name: "Lisa" )
