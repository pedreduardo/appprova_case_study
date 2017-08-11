class Site::Profile::DashboardController < Site::ProfileController
  
  def index
    @students = Student.filter(params[:search]).mine(current_member).page(params[:page])
  end
end