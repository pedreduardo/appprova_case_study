class Site::Profile::StudentsController < Site::ProfileController

  def index
    @students = Student.filter(params[:search]).page(params[:page])
  end
end
