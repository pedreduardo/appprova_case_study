class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: I18n.t('messages.created_with', item: @admin.name)
    else
      render :new
    end
  end

  def edit
    authorize @admin unless current_admin.id == @admin.id
  end

  def update
    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: I18n.t('messages.updated_with', item: @admin.name)
    else
      render action: :edit
    end
  end

  def destroy
    authorize @admin
    admin_name = @admin.name
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: I18n.t('messages.destroyed_with', item: admin_name)
    else
      render index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    (params[:admin] = params[:admin].except(:password, :password_confirmation)) if password_blank?
    if @admin.blank?
      params.require(:admin).permit(:email, :password, :role, :password_confirmation, :name)
    else
      params.require(:admin)
            .permit(policy(@admin).permitted_attributes)
    end
  end

  def password_blank?
    params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
  end
end
