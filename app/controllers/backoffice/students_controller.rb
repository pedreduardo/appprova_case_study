require 'rubygems'

class Backoffice::StudentsController < BackofficeController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.member = Member.find_by(id: params[:member][:id])

    if @student.save
      redirect_to backoffice_students_path, notice: I18n.t('messages.created_with', item: @student.name)
    else
      render :new
    end
  end

  def update
    @student.member = Member.find_by(id: params[:member][:id])
    if @student.update(student_params)
      redirect_to backoffice_students_path, notice: I18n.t('messages.updated_with', item: @student.name)
    else
      render action: :edit
    end
  end

  def destroy
    member_name = @student.name
    if @student.destroy
      redirect_to backoffice_students_path, notice: I18n.t('messages.destroyed_with', item: member_name)
    else
      render index
    end
  end

  def import
    begin
      if Student.import(params[:file])
        redirect_to backoffice_students_path, notice: I18n.t('messages.import_success')
      end
    rescue => ex
      redirect_to backoffice_students_path, alert: I18n.t('messages.import_error')
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name)
    end
end
