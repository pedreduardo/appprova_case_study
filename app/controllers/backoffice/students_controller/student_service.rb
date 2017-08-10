class Backoffice::StudentsController::StudentService
  class << self
    def import_excel(file)
      sheet = Roo::Spreadsheet.open(file)
      sheet.each_with_index(
        university: 'UNIVERSIDADE',
        course: 'CURSO',
        campus: 'CAMPUS',
        name: 'NOME',
        grade: 'NOTA',
        classification: 'CLASSIFICAÇÃO',
        enem_number: 'ENEM', 
        obs: 'OBS',
        public_university: 'ESCOLA_PUBLICA') do |hash, line|
        next unless line > 0
          create_student(hash)
      end
    end

  protected
    def create_student(hash)
      Student.create!(
        university: hash[:university],
        course: hash[:course],
        campus: hash[:campus],
        name: hash[:name],
        grade: hash[:rate],
        classification: hash[:classification],
        enem_number: hash[:enem_number],
        obs: hash[:obs],
        public_university: hash[:public_university],
        member_id: 1)
    end
  end
end
