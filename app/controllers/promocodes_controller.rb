class PromocodesController < ApplicationController
  before_action :set_promocode, only: [:show, :edit, :update, :destroy]

  # GET /promocodes
  # GET /promocodes.json
  def index
    @promocodes = Promocode.all
  end

  # GET /promocodes/1
  # GET /promocodes/1.json
  def show
  end

  # GET /promocodes/new
  def new
    @promocode = Promocode.new
  end

  # GET /promocodes/1/edit
  def edit
  end

  # POST /promocodes
  # POST /promocodes.json
  def create
    @promocode = Promocode.new(promocode_params)
    respond_to do |format|
      if @promocode.save
        format.html { redirect_to @promocode, notice: 'Promocode was successfully created.' }
        format.json { render :show, status: :created, location: @promocode }
      else
        format.html { render :new }
        format.json { render json: @promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promocodes/1
  # PATCH/PUT /promocodes/1.json
  def update
    respond_to do |format|
      if @promocode.update(promocode_params)
        format.html { redirect_to @promocode, notice: 'Promocode was successfully updated.' }
        format.json { render :show, status: :ok, location: @promocode }
      else
        format.html { render :edit }
        format.json { render json: @promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promocodes/1
  # DELETE /promocodes/1.json
  def destroy
    @promocode.destroy
    respond_to do |format|
      format.html { redirect_to promocodes_url, notice: 'Promocode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Check existance and validity
  def checkPromo
    # Respond to only ajax request
    respond_to do |format|
      format.json { 
        @code = Promocode.find_by codetext: params[:code]
        if @code.nil?
          # Setup error code for errors to make it easy on the client side
          render json: {:errors=>'Code not found'}
        else
          @code.timesused+=1
          @code.save()
          render json: @code    
        end
      }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promocode
      @promocode = Promocode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promocode_params
      params.require(:promocode).permit(:codetext, :timesused, :discount_value, :validity)
    end

end
