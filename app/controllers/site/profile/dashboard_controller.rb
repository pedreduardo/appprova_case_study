class Site::Profile::DashboardController < Site::ProfileController
  def index
    @students = Student.my_alumni(current_member.id).page(params[:page])
  end
end
