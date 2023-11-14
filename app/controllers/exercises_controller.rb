class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  before_action :set_select_collections, only: [:edit, :update, :new, :create]

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs)
    @tools = Tool.all
  end

  def filter
    exercises = Exercise
      .includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs)
    if !params[:tool_id].empty?
      exercises = exercises.where(tools: { id: params[:tool_id]})
    end
      #.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'exercises', locals: { exercises: exercises })
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    @exercise = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs).find(params[:id])
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    @movement_patterns = MovementPattern.all
    @muscles = Muscle.all
    @tools = Tool.all
  end

  # GET /exercises/1/edit
  def edit
    @movement_patterns = MovementPattern.all
    @muscles = Muscle.all
    @tools = Tool.all
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params.except(:tool_ids, :movement_pattern_ids, :muscle_ids))
    create_or_delete_exercise_tools(@exercise, params[:exercise][:tool_ids])
    create_or_delete_exercise_movement_patterns(@exercise, params[:exercise][:movement_pattern_ids])
    create_or_delete_exercise_muscles(@exercise, params[:exercise][:muscle_ids])

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    create_or_delete_exercise_tools(@exercise, params[:exercise][:tool_ids])
    create_or_delete_exercise_movement_patterns(@exercise, params[:exercise][:movement_pattern_ids])
    create_or_delete_exercise_muscles(@exercise, params[:exercise][:muscle_ids])
    respond_to do |format|
      if @exercise.update(exercise_params.except(:tool_ids, :movement_pattern_ids, :muscle_ids))
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy!

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # tools assignment
    def create_or_delete_exercise_tools(exercise, tool_ids)
      exercise.exercise_tools.destroy_all
      tool_ids.each do |tool|
        if !tool.nil? && !tool.empty?
          exercise.tools << Tool.find(tool)
        end
      end
    end

    def create_or_delete_exercise_movement_patterns(exercise, movement_pattern_ids)
      exercise.exercise_movement_patterns.destroy_all
      movement_pattern_ids.each do |movement_pattern|
        if !movement_pattern.nil? && !movement_pattern.empty?
          exercise.movement_patterns << MovementPattern.find(movement_pattern)
        end
      end
    end

    def create_or_delete_exercise_muscles(exercise, muscle_ids)
      exercise.exercise_muscles.destroy_all
      muscle_ids.each do |muscle|
        if !muscle.nil? && !muscle.empty?
          exercise.muscles << Muscle.find(muscle)
        end
      end
    end

    def set_select_collections
      @muscles = Muscle.all
      @tools = Tool.all
      @movement_patterns = MovementPattern.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :description, :difficulty, :tool_ids, :movement_pattern_ids, :muscle_ids)
    end
end
