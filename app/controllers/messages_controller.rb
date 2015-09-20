class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /messages
  # POST /messages.json
  def createOtp
    rcap = RingCaptcha::RingCaptcha.new('otihu7i4ohe2eramo9yg', 'u3eseta7agi8e2eku4o5')
      
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sendOtp
    respond_to do |format|
      format.json {
        #Create the hash for the message creation
        begin
          rcm =  RingCaptcha::RingCaptcha.new('otihu7i4ohe2eramo9yg', 'u3eseta7agi8e2eku4o5')
          phonenumber = '+91'+params[:phonenumber].to_s
          otpcode = rand.to_s[2..8]
          # Improvise to check bevore you send
          message = 'OTP Verfication for Hathi: ' + otpcode
          Message.create({
            :text =>  otpcode,
            :phonenumber => params[:phonenumber],
            :status => 'Sent',
            :verified => false,
            :message => message
          })
          # rcm.sendSms(phonenumber, message)
        rescue
          raise "Error while trying to create a message"
        end
      }
    end
  end

  # Check existance and validity
  def checkOtp
    # Respond to only ajax request
    respond_to do |format|
      format.json { 
        @code = Message.find_by_text_and_verified(params[:otp],0)
        if @code.nil?
          # Setup error code for errors to make it easy on the client side
          render json: {:errors=>'Code not found'}
        else
          @code.verified = true
          @code.save
          render json: @code    
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:text, :status, :verified)
    end
end
