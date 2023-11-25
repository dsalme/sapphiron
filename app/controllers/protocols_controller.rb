class ProtocolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_protocol, only: %i[show edit update destroy]

  # GET /protocols or /protocols.json
  def index
    @protocols = Protocol.all
  end

  # GET /protocols/1 or /protocols/1.json
  def show
  end

  # GET /protocols/new
  def new
    @protocol = Protocol.new
  end

  # GET /protocols/1/edit
  def edit
  end

  # POST /protocols or /protocols.json
  def create
    new_protocol = {**protocol_params, :measure_unit => protocol_params[:measure_unit].to_i}
    @protocol = Protocol.new(new_protocol)

    respond_to do |format|
      if @protocol.save
        format.html { redirect_to protocol_url(@protocol), notice: "Protocol was successfully created." }
        format.json { render :show, status: :created, location: @protocol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protocols/1 or /protocols/1.json
  def update
    new_protocol = {**protocol_params, :measure_unit => protocol_params[:measure_unit].to_i}
    respond_to do |format|
      if @protocol.update(new_protocol)
        format.html { redirect_to protocol_url(@protocol), notice: "Protocol was successfully updated." }
        format.json { render :show, status: :ok, location: @protocol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protocols/1 or /protocols/1.json
  def destroy
    @protocol.destroy!

    respond_to do |format|
      format.html { redirect_to protocols_url, notice: "Protocol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_protocol
    @protocol = Protocol.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def protocol_params
    params.require(:protocol).permit(:name, :description, :measure_unit)
  end
end
