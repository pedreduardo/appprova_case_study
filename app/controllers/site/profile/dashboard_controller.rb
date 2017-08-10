class Site::Profile::DashboardController < Site::ProfileController
  def index
    @students = current_member.students.order(:name).page(params[:page])
  end
end
