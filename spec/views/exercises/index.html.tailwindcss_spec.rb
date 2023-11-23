require 'rails_helper'

RSpec.describe 'exercises/index', type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: 'Legs') }
  let(:muscle) { Muscle.create!(name: 'Quadriceps', muscle_group:) }

  before(:each) do
    # allow_any_instance_of(ActionController::Base).to receive(:rodauth).and_return(double(logged_in?: true))
    assign(:exercises, [
             Exercise.create!(
               name: 'Name'
             ),
             Exercise.create!(
               name: 'Name2'
             )
           ])
    assign(:muscle_groups, [muscle_group])
    assign(:muscles, [muscle])
    assign(:tools, [])
    assign(:movement_patterns, [])
  end

  it 'renders a list of exercises' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("hola".to_s), count: 2
  end
end
