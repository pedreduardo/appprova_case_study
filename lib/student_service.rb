class StudentService
  class << self
    def import_excel(file)
      sheet = Roo::Spreadsheet.open(file)
      sheet.each_with_index(
        university: 'UNIVERSIDADE', course: 'CURSO',
        name: 'NOME', grade: 'NOTA',
        classification: 'POSIÇÃO', obs: 'EXTRA'
      ) do |hash, line|
        next unless line > 0
        create_student hash
      end
    end

    def create_student(hash)
      Student.create!(
        university: hash[:university],
        course: hash[:course],
        name: hash[:name],
        grade: hash[:rate],
        classification: hash[:classification],
        obs: hash[:obs],
        member_id: 1
      )
    end
  end
end
