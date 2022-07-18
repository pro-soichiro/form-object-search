class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @form = UsersSearchForm.new(users_search_form_params)
    @users = @form.search
  end

  def show
  end

  def new
    @form = UserForm.new
  end

  def create
    @form = UserForm.new(user_form_params)

    respond_to do |format|
      if @form.save
        @user = User.last
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @form = UserForm.new(user: @user)
  end

  def update
    @form = UserForm.new(user_form_params, user: @user)

    respond_to do |format|
      if @form.save
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_form_params
      params.require(:user).permit(UserForm::ATTRIBUTES)
    end

    def users_search_form_params
      return {} if params[:users_search_form].blank?

      params.require(:users_search_form).permit(UsersSearchForm::ATTRIBUTES)
    end
end
