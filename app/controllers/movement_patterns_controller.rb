class MovementPatternsController < ApplicationController
  before_action :set_movement_pattern, only: %i[ show edit update destroy ]

  # GET /movement_patterns or /movement_patterns.json
  def index
    @movement_patterns = MovementPattern.all
  end

  # GET /movement_patterns/1 or /movement_patterns/1.json
  def show
  end

  # GET /movement_patterns/new
  def new
    @movement_pattern = MovementPattern.new
  end

  # GET /movement_patterns/1/edit
  def edit
  end

  # POST /movement_patterns or /movement_patterns.json
  def create
    @movement_pattern = MovementPattern.new(movement_pattern_params)

    respond_to do |format|
      if @movement_pattern.save
        format.html { redirect_to movement_patterns_url, notice: "Movement pattern was successfully created." }
        format.json { render :all, status: :created, location: @movement_patterns }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movement_patterns/1 or /movement_patterns/1.json
  def update
    respond_to do |format|
      if @movement_pattern.update(movement_pattern_params)
        format.html { redirect_to movement_pattern_url(@movement_pattern), notice: "Movement pattern was successfully updated." }
        format.json { render :show, status: :ok, location: @movement_pattern }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movement_patterns/1 or /movement_patterns/1.json
  def destroy
    @movement_pattern.destroy!

    respond_to do |format|
      format.html { redirect_to movement_patterns_url, notice: "Movement pattern was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement_pattern
      @movement_pattern = MovementPattern.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_pattern_params
      params.require(:movement_pattern).permit(:name, :description)
    end
end
