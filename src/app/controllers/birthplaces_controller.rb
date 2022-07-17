class BirthplacesController < ApplicationController
  before_action :set_birthplace, only: %i[ show edit update destroy ]

  # GET /birthplaces or /birthplaces.json
  def index
    @birthplaces = Birthplace.all
  end

  # GET /birthplaces/1 or /birthplaces/1.json
  def show
  end

  # GET /birthplaces/new
  def new
    @birthplace = Birthplace.new
  end

  # GET /birthplaces/1/edit
  def edit
  end

  # POST /birthplaces or /birthplaces.json
  def create
    @birthplace = Birthplace.new(birthplace_params)

    respond_to do |format|
      if @birthplace.save
        format.html { redirect_to birthplace_url(@birthplace), notice: "Birthplace was successfully created." }
        format.json { render :show, status: :created, location: @birthplace }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @birthplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /birthplaces/1 or /birthplaces/1.json
  def update
    respond_to do |format|
      if @birthplace.update(birthplace_params)
        format.html { redirect_to birthplace_url(@birthplace), notice: "Birthplace was successfully updated." }
        format.json { render :show, status: :ok, location: @birthplace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @birthplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birthplaces/1 or /birthplaces/1.json
  def destroy
    @birthplace.destroy

    respond_to do |format|
      format.html { redirect_to birthplaces_url, notice: "Birthplace was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_birthplace
      @birthplace = Birthplace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def birthplace_params
      params.require(:birthplace).permit(:prefecture_id, :detail, :user_id)
    end
end
