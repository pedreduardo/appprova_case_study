class Backoffice::StudentsController < BackofficeController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def import
    if StudentService.import_excel(params[:file])
      redirect_to backoffice_students_path, notice: I18n.t('messages.import_success')
    end
    rescue
      redirect_to backoffice_students_path, alert: I18n.t('messages.import_error')
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name)
  end
end
