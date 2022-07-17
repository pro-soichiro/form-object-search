class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def index
    @form = UsersSearchForm.new(users_search_form_params)
    @users = @form.search
  end

  def show
  end

  def new
    @user = UserForm.new
  end

  def edit
    @user = UserForm.find(params[:id])
    puts @user
    puts @user.class
    # @user = UserForm.edit(params[:id])
  end

  def create
    @user = UserForm.new(user_form_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        # format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_form_params)
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
      return {} if params[:users_search_form].blank?
      # params.require(:user_form).permit(:last_name, :first_name, :born_on, birthplace: [:prefecture_id, :detail])
      params.require(:user_form).permit(:last_name, :first_name, :born_on, :prefecture_id, :detail)
    end

    def users_search_form_params
      return {} if params[:users_search_form].blank?

      params.require(:users_search_form).permit(UsersSearchForm::ATTRIBUTES)
    end
end
