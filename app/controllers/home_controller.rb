class HomeController < ApplicationController
  def index
    @url_map = [
      { "name" => "Muscles", "path" => muscles_path },
      { "name" => "Muscle Groups", "path" => muscle_groups_path },
      { "name" => "Movement Patterns", "path" => movement_patterns_path },
      { "name" => "Tools", "path" => tools_path },
      { "name" => "Exercises", "path" => exercises_path },
    ]
  end
end
