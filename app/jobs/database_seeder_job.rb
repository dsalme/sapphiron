class DatabaseSeederJob < ApplicationJob
  queue_as :default

  def perform
    ActiveRecord::Base.transaction do
      create_muscle_groups
      create_movement_patterns
      create_tools
    end
    ActiveRecord::Base.transaction do
      create_muscles
    end
  end

  private

  def create_muscle_groups
    MuscleGroup.create!(
      name: 'Legs',
      description: 'two pieces of piernitas'
    )
    MuscleGroup.create!(
      name: 'Arms',
      description: 'two pieces of bracitos'
    )
  end

  def create_muscles
    Muscle.create!(
      name: 'Quads',
      description: Faker::Lorem.sentence,
      muscle_group: MuscleGroup.find_by(name: 'Legs')
    )
    Muscle.create!(
      name: 'Hamstrings',
      description: Faker::Lorem.sentence,
      muscle_group: MuscleGroup.find_by(name: 'Legs')
    )
    Muscle.create!(
      name: 'Calves',
      description: Faker::Lorem.sentence,
      muscle_group: MuscleGroup.find_by(name: 'Legs')
    )
    Muscle.create!(
      name: 'Biceps',
      description: Faker::Lorem.sentence,
      muscle_group: MuscleGroup.find_by(name: 'Arms')
    )
    Muscle.create!(
      name: 'Triceps',
      description: Faker::Lorem.sentence,
      muscle_group: MuscleGroup.find_by(name: 'Arms')
    )
  end

  def create_movement_patterns
    MovementPattern.create!(
      name: 'Pull',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Push',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Squat',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Hinge',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Lunge',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Rotation/Antirotation',
      description: Faker::Lorem.sentence
    )
    MovementPattern.create!(
      name: 'Gait',
      description: Faker::Lorem.sentence
    )
  end

  def create_tools
    Tool.create!(
      name: 'Kettlebell',
      description: Faker::Lorem.sentence,
      thumbnail_url: 'shared/kettle_icon'
    )
    Tool.create!(
      name: 'Dumbell',
      description: Faker::Lorem.sentence,
      thumbnail_url: 'shared/dumbell_icon'
    )
    Tool.create!(
      name: 'Bodyweight',
      description: Faker::Lorem.sentence,
      thumbnail_url: 'shared/bodyweight_icon'
    )
  end
end
