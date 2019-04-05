class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?, only: [:index, :new, :create, :edit, :update, :show, :setting, :pdf_generate]
  before_action :user, only: [:edit, :show, :setting, :update, :destroy, :pdf_generate, :change_theme_color]
  before_action :color, only: [:show, :setting, :pdf_generate]

  def index
    @users = User.all.where.not(role: 'admin').order(name: :asc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.skip_password_validation = true
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user.descriptions.build
  end

  def show; end

  def setting; end

  def update
    if @user.update(user_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def pdf_generate
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'show', layout: 'pdf', disposition: 'attachment'
      end
    end
  end

  def remove_avatar
    @user.avatar.delete
  end

  def remove_logo
    @user.logo.delete
  end

  def destroy
    @user.descriptions.destroy_all
    if @user.destroy
      redirect_to root_url
    else
    end
  end

  def change_theme_color
    if @user.update(color_code: params[:user][:color_code])
      redirect_to root_url
    else
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def color
    @color = @user.color_code.present? ? @user.color_code : '#1a295e'
  end

  def admin_user?
    current_user.present? && current_user.role == 'admin'
  end

  def user_params
    params.require(:user).permit(:name, :email, :address, :contact_no, :company_name, :website,
                                 :avatar, :logo, :linkedin_url, :facebook_url, :twitter_url, :message,
                                 descriptions_attributes: [:id, :feature, :_destroy])
  end
end
