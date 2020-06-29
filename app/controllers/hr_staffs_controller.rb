class HrStaffsController < ApplicationController
  before_action :set_hr_staff, only: [:show, :edit, :update, :destroy]

  # GET /hr_staffs
  # GET /hr_staffs.json
  def index
    @hr_staffs = User.where(:hr_staff => true, :admin => false).all
  end

  # GET /hr_staffs/1
  # GET /hr_staffs/1.json
  def show
  end

  # GET /hr_staffs/new
  def new
    @hr_staff = User.new
  end

  # GET /hr_staffs/1/edit
  def edit
  end

  # POST /hr_staffs
  # POST /hr_staffs.json
  def create
    @hr_staff = User.new(hr_staff_params)
    @hr_staff[:hr_staff] = true
    respond_to do |format|
      if @hr_staff.save
        format.html { redirect_to hr_staff_path(@hr_staff), notice: 'Hr staff was successfully created.' }
        format.json { render :show, status: :created, location: @hr_staff }
      else
        format.html { render :new }
        format.json { render json: @hr_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hr_staffs/1
  # PATCH/PUT /hr_staffs/1.json
  def update
    respond_to do |format|
      if @hr_staff.update(hr_staff_params)
        format.html { redirect_to hr_staff_path(@hr_staff), notice: 'Hr staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @hr_staff }
      else
        format.html { render :edit }
        format.json { render json: @hr_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_staffs/1
  # DELETE /hr_staffs/1.json
  def destroy
    @hr_staff.destroy
    respond_to do |format|
      format.html { redirect_to hr_staff_index_path, notice: 'Hr staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr_staff
      @hr_staff = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hr_staff_params
      params.fetch(:user).permit(:email, :password, :password_confirmation, :hr_staff)
    end
end
