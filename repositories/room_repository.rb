require 'csv'
require_relative '../models/room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private
  
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i # Convert column to Integer
      new_room = Room.new(row)
      @rooms << new_room
    end

    if @rooms.empty?
      @next_id = 1
    else
      @next_id = @rooms.last.id + 1
    end
  end

  def save_csv
  end
end
