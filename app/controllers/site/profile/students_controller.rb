class Site::Profile::StudentsController < Site::ProfileController
  def index
    @students = Student.not_mine
                       .filter(params[:search]).page(params[:page])
  end

  def students_by_member
    @students = Student.filter(params[:search]).mine(current_member).page(params[:page])
  end

  def add_to_member
    @student = Student.find(params[:format])
    @student.member_id = current_member.id
    if @student.save!
      render json: { student_id: @student.id }
    else
      render json: { error: true }
    end
  end
end
