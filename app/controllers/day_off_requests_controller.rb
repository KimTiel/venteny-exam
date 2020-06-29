class DayOffRequestsController < ApplicationController
  before_action :set_day_off_request, only: [:show, :edit, :update, :destroy, :approve, :denied]
  before_action :count_day_off_approved, only: [:index]

  # GET /day_off_requests
  # GET /day_off_requests.json
  def index
    if current_user.admin == true || current_user.hr_staff == true
      @day_off_requests = DayOffRequest.all
    else
      @day_off_requests = DayOffRequest.where(user_id: current_user.id)
    end
  end

  # GET /day_off_requests/1
  # GET /day_off_requests/1.json
  def show
  end

  # GET /day_off_requests/new
  def new
    @day_off_request = DayOffRequest.new
  end

  # GET /day_off_requests/1/edit
  def edit
  end

  # POST /day_off_requests
  # POST /day_off_requests.json
  def create
    @day_off_request = DayOffRequest.new(day_off_request_params)

    respond_to do |format|
      if @day_off_request.save
        format.html { redirect_to @day_off_request, notice: 'Day off request was successfully created.' }
        format.json { render :show, status: :created, location: @day_off_request }
      else
        format.html { render :new }
        format.json { render json: @day_off_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_off_requests/1
  # PATCH/PUT /day_off_requests/1.json
  def update
    respond_to do |format|
      @day_off_request = DayOffRequest.find(params[:id])
      @day_off_request[:approve] = params[:approve]
      @day_off_request[:denied] = params[:denied]
      if @day_off_request.update(day_off_request_params)
        format.html { redirect_to @day_off_request, notice: 'Day off request was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_off_request }
      else
        format.html { render :edit }
        format.json { render json: @day_off_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_off_requests/1
  # DELETE /day_off_requests/1.json
  def destroy
    @day_off_request.destroy
    respond_to do |format|
      format.html { redirect_to day_off_requests_url, notice: 'Day off request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @day_off_request.update(approve: true, denied: false)
    respond_to do |format|
      format.html { redirect_to day_off_requests_url, notice: 'Day off request was successfully approved.' }
      format.json { head :no_content }
    end
  end

  def denied
    @day_off_request.update(approve: false, denied: true)
    respond_to do |format|
      format.html { redirect_to day_off_requests_url, notice: 'Day off request was successfully approved.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_off_request
      @day_off_request = DayOffRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_off_request_params
      params.require(:day_off_request).permit(:reason, :day_off_date, :user_id, :approve, :denied)
    end

    def count_day_off_approved
      @day_off_request_approved = DayOffRequest.where("user_id = ? and day_off_date > ? AND day_off_date < ? and approve = ?", current_user, (Date::new(Date.today.year,01,01).beginning_of_year), (Date::new(Date.today.year,01,01).end_of_year), true)
    end
    
end
