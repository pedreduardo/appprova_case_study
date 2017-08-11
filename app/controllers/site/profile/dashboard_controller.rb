class Site::Profile::DashboardController < Site::ProfileController

  def index
    @students = current_member.students.limit(500)
    members = Member
              .joins(:students)
              .select('members.id ,members.name_school, count(students.id) as student_count')
              .group('members.id')
    amount = 0
    members.each do |member|
      amount += member['student_count']
    end
    @average_of_students = amount / members.size
  end
end
