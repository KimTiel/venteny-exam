class DayoffsController < ApplicationController
  before_action :set_dayoff, only: [:show, :edit, :update, :destroy]

  # GET /dayoffs
  # GET /dayoffs.json
  def index
    @dayoffs = Dayoff.all
  end

  # GET /dayoffs/1
  # GET /dayoffs/1.json
  def show
  end

  # GET /dayoffs/new
  def new
    @dayoff = Dayoff.new
  end

  # GET /dayoffs/1/edit
  def edit
  end

  # POST /dayoffs
  # POST /dayoffs.json
  def create
    @dayoff = Dayoff.new(dayoff_params)

    respond_to do |format|
      if @dayoff.save
        format.html { redirect_to @dayoff, notice: 'Dayoff was successfully created.' }
        format.json { render :show, status: :created, location: @dayoff }
      else
        format.html { render :new }
        format.json { render json: @dayoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dayoffs/1
  # PATCH/PUT /dayoffs/1.json
  def update
    respond_to do |format|
      if @dayoff.update(dayoff_params)
        format.html { redirect_to @dayoff, notice: 'Dayoff was successfully updated.' }
        format.json { render :show, status: :ok, location: @dayoff }
      else
        format.html { render :edit }
        format.json { render json: @dayoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dayoffs/1
  # DELETE /dayoffs/1.json
  def destroy
    @dayoff.destroy
    respond_to do |format|
      format.html { redirect_to dayoffs_url, notice: 'Dayoff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dayoff
      @dayoff = Dayoff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dayoff_params
      params.require(:dayoff).permit(:no_dayoff)
    end
end
