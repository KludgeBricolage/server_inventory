class SparesController < ApplicationController
  before_action :set_spare, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /spares
  # GET /spares.json
  def index
    if request.path.include? "/spare/"
      spares = Spare.where(category: params[:category])
      @spares = params[:q] ? spares.search(params[:q]) : spares
    else
      @spares = params[:q] ? Spare.search(params[:q]) : Spare.all
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /spares/1
  # GET /spares/1.json
  def show
  end

  # GET /spares/new
  def new
    @spare = Spare.new
  end

  # GET /spares/1/edit
  def edit
  end

  # POST /spares
  # POST /spares.json
  def create
    @spare = Spare.new(spare_params)

    respond_to do |format|
      if @spare.save
        format.html { redirect_to @spare, notice: 'Spare was successfully created.' }
        format.json { render :show, status: :created, location: @spare }
      else
        format.html { render :new }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spares/1
  # PATCH/PUT /spares/1.json
  def update
    respond_to do |format|
      if @spare.update(spare_params)
        format.html { redirect_to @spare, notice: 'Spare was successfully updated.' }
        format.json { render :show, status: :ok, location: @spare }
      else
        format.html { render :edit }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spares/1
  # DELETE /spares/1.json
  def destroy
    @spare.destroy
    respond_to do |format|
      format.html { redirect_to spares_url, notice: 'Spare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare
      @spare = Spare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spare_params
      params.require(:spare).permit(:item_type ,:description ,:stock ,:date_delivered ,:date_warranty ,:balance ,:category)
    end
end
