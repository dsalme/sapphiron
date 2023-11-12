json.id exercise.id
json.name exercise.name
json.description exercise.description
json.difficulty exercise.difficulty

json.tools exercise.tools do |tool|
    json.id tool.id
    json.name tool.name
    json.thumbnail_url tool.thumbnail_url
end

json.tools exercise.movement_patterns do |tool|
    json.id movement_pattern.id
    json.name movement_pattern.name
end

json.tools exercise.muscles do |tool|
    json.id muscle.id
    json.name muscle.name
end

#json.extract! exercise, :id, :name, :description, :tools, :difficulty, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
