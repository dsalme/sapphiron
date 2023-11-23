require 'rails_helper'

RSpec.describe 'exercises/edit', type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: 'Legs') }
  let(:muscle) { Muscle.create!(name: 'Quadriceps', muscle_group:) }
  let(:exercise) { Exercise.create!(name: 'Squats', description: 'Leg exercise') }

  before(:each) do
    assign(:exercise, exercise)
    assign(:muscle_groups, [muscle_group])
    assign(:muscles, [muscle])
    assign(:tools, [])
    assign(:movement_patterns, [])
  end

  it 'renders the edit exercise form' do
    render

    assert_select 'form[action=?][method=?]', exercise_path(exercise), 'post' do
      assert_select 'input[name=?]', 'exercise[name]'

      assert_select 'textarea[name=?]', 'exercise[description]'
    end
  end
end
