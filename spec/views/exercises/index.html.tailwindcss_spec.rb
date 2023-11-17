require 'rails_helper'

RSpec.describe "exercises/index", type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: "Legs") }
  let(:muscle) { Muscle.create!(name: "Quadriceps", muscle_group: muscle_group) }
  before(:each) do
    assign(:exercises, [
      Exercise.create!(
        name: "Name",
        description: "MyText"
      ),
      Exercise.create!(
        name: "Name2",
        description: "MyText"
      )
    ])
    assign(:muscle_groups, [muscle_group])
    assign(:muscles, [muscle])
    assign(:tools, [])
    assign(:movement_patterns, [])
  end

  it "renders a list of exercises" do
    render
    #cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
