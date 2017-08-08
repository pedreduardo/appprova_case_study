require 'roo'
require 'roo-xls'

class Student < ApplicationRecord
  belongs_to :member

  def self.import(file)

    sheet = Roo::Spreadsheet.open(file)
    header = sheet.row(1)

    puts '----------------'
    puts header
    puts '----------------'

    sheet.each_with_index(
      university: 'UNIVERSIDADE',
      course: 'CURSO',
      name: 'NOME',
      grade: 'NOTA',
      classification: 'POSIÇÃO',
      obs: 'EXTRA') do |hash, line|
      
      if line > 0 
        student = Student.new(
          university: hash[:university],
          course: hash[:course],
          name: hash[:name],
          grade: hash[:rate],
          classification: hash[:classification],
          obs: hash[:obs])
        
        student.member_id = 1
        student.save!
      end
    end
  end
end
