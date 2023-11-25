class AspectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_aspect, only: %i[ show edit update destroy ]

  # GET /aspects or /aspects.json
  def index
    @aspects = Aspect.all
  end

  # GET /aspects/1 or /aspects/1.json
  def show
  end

  # GET /aspects/new
  def new
    @aspect = Aspect.new
  end

  # GET /aspects/1/edit
  def edit
  end

  # POST /aspects or /aspects.json
  def create
    @aspect = Aspect.new(aspect_params)

    respond_to do |format|
      if @aspect.save
        format.html { redirect_to aspect_url(@aspect), notice: "Aspect was successfully created." }
        format.json { render :show, status: :created, location: @aspect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aspects/1 or /aspects/1.json
  def update
    respond_to do |format|
      if @aspect.update(aspect_params)
        format.html { redirect_to aspect_url(@aspect), notice: "Aspect was successfully updated." }
        format.json { render :show, status: :ok, location: @aspect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aspects/1 or /aspects/1.json
  def destroy
    @aspect.destroy!

    respond_to do |format|
      format.html { redirect_to aspects_url, notice: "Aspect was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspect
      @aspect = Aspect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aspect_params
      params.require(:aspect).permit(:name, :description)
    end
end
