class Site::Profile::MyStudentsController < Site::ProfileController
  
  def index
    @students = Student.filter(params[:search]).mine(current_member).page(params[:page])
  end
end