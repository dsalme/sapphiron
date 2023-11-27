class ExercisesController < ApplicationController
  include ExerciseToolsConcern
  include ExerciseMusclesConcern
  include ExerciseMovementPatternsConcern
  include ExerciseFilterConcern
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_exercise, only: %i[show edit update destroy]
  before_action :set_select_collections, only: %i[edit update new create]

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs)
    @tools = Tool.all
    @muscles = Muscle.all
    @muscle_groups = MuscleGroup.all
    @movement_patterns = MovementPattern.all
  end

  def filter
    exercises = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs)
    FILTER_PARAMS.each do |param, filter|
      if params[param].present? && !params[param].empty?
        exercises = exercises.where(filter[:association] => { "#{filter[:field]}": params[param] })
      end
    end
    render(partial: 'exercises', locals: { exercises: })
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    @exercise = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs).find(params[:id])
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    @movement_patterns = MovementPattern.all
    @muscle_groups = MuscleGroup.includes(:muscles)
    @tools = Tool.all
  end

  # GET /exercises/1/edit
  def edit
    @movement_patterns = MovementPattern.all
    @muscle_groups = MuscleGroup.includes(:muscles)
    @tools = Tool.all
  end

  def set_filter_models
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params.except(:tool_ids, :movement_pattern_ids, :muscle_ids))
    @exercise.user_id = current_user.id
    create_related_entities(@exercise, exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercise_url(@exercise), notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    create_related_entities(@exercise, exercise_params)
    respond_to do |format|
      if @exercise.update(exercise_params.except(:tool_ids, :movement_pattern_ids, :muscle_ids))
        format.html { redirect_to exercise_url(@exercise), notice: 'Exercise was successfully updated.' }
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
      format.html { redirect_to exercises_url, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def create_related_entities(exercise, params)
    create_or_delete_exercise_tools(exercise, params[:tool_ids])
    create_or_delete_exercise_movement_patterns(exercise, params[:movement_pattern_ids])
    create_or_delete_exercise_muscles(exercise, params[:muscle_ids])
  end

  def set_select_collections
    @muscles = Muscle.all
    @muscle_groups = MuscleGroup.all
    @tools = Tool.all
    @movement_patterns = MovementPattern.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.includes(:tools, :movement_patterns, :muscles, :variants, :variant_ofs).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exercise_params
    params.require(:exercise).permit(:name, :description, :difficulty, tool_ids: [], movement_pattern_ids: [],
                                                                       muscle_ids: [])
  end
end
