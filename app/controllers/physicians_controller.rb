class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]

  def index
    @physicians = Physician.all
  end

  def show
  end

  def new
    @physician = Physician.new
  end

  def edit
  end

  def create
    @physician = Physician.new(physician_params)

    respond_to do |format|
      if @physician.save
        # Tell the physicianMailer to send a welcome email after save
        format.html { redirect_to @physician, notice: 'physician was successfully created.' }
        format.json { render action: 'show', status: :created, location: @physician }
      else
        format.html { render action: 'new' }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to @physician, notice: 'physician was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Rails.logger.debug ">>>>>>>entred physician destroy"
    @physician.destroy
    respond_to do |format|
      format.html { redirect_to physicians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physician
      @physician = Physician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physician_params
      params.require(:physician).permit(:name, :email, :login)
    end
end
