class Site::Profile::DashboardController < Site::ProfileController
  def index
    @students = current_member.students.limit(500)
    members = Member.average_students
    amount = 0
    members.each do |member|
      amount += member['student_count']
    end
    @average_of_students = members.size.zero? ? 0 : (amount / members.size)
  end
end
