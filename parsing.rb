# What is parsing?
# Parsing is translating from CSV to Ruby

require 'csv'
require_relative File.join(__dir__, '/models/patient')
csv_file = File.join(__dir__, '/database/patients.csv')

patients = []
csv_options = { headers: :first_row, header_converters: :symbol }
CSV.foreach(csv_file, csv_options) do |row|
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean
  patients << Patient.new(row)
end

p patients
