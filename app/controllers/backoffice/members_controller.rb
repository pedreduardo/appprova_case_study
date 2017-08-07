class Backoffice::MembersController < BackofficeController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to backoffice_members_path, notice: I18n.t('messages.created_with', item: @member.name)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @member.update(member_params)
      redirect_to backoffice_members_path, notice: I18n.t('messages.updated_with', item: @member.name)
    else
      render action: :edit
    end
  end

  def destroy
    member_name = @member.name
    if @member.destroy
      redirect_to backoffice_members_path, notice: I18n.t('messages.destroyed_with', item: member_name)
    else
      render index
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    (params[:member] = params[:member].except(:password, :password_confirmation)) if password_blank?
    params.require(:member).permit(:email, :password, :password_confirmation,
                                   :first_name, :last_name, :cell_phone,
                                   :name_school, :cnpj_school)
  end

  def password_blank?
    params[:member][:password].blank? &&
      params[:member][:password_confirmation].blank?
  end
end
