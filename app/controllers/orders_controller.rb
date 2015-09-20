class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(create_order_params)

    respond_to do |format|
      if @order.save
        UserMailer.order_email(@order).deliver
        puts "Sending order emiL"
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:pickup, :drop, :pick_time, :vehicletype, :mobilenumber, :items, :labour, :couponused, :verified, :pick_floor, :drop_floor, :drop_lift, :pick_lift, :pick_landmark, :drop_landmark, :pick_detailed_address, :drop_detailed_address)
    end

    def create_order_params
      parameters = {
        :pickup=> params[:pickup],
        :drop=> params[:drop],
        :pick_time=> params[:pick_datetime],
        :vehicletype=> params[:vehicletype],
        :mobilenumber=> params[:mobilenumber],
        :items=> params[:items],
        :labour=> params[:labour],
        :couponused => params[:couponused],
        :verified=> params[:verified],
        :pick_lift=> params[:pick_lift],
        :drop_lift=> params[:drop_lift],
        :pick_floor=> params[:pick_floor],
        :drop_floor=> params[:drop_floor],
        :pick_landmark=> params[:pick_landmark],
        :drop_landmark=> params[:drop_landmark],
        :pick_detailed_address=> params[:pick_detailed_address],
        :drop_detailed_address=> params[:drop_detailed_address],
      }
    end
end
