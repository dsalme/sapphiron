require 'rails_helper'

RSpec.describe "muscles/index", type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: "Legs") }
  before(:each) do
    Muscle.destroy_all
    assign(:muscles, [
      Muscle.create!(
        name: "Name",
        description: "MyText",
        muscle_group: muscle_group
      ),
      Muscle.create!(
        name: "Name2",
        description: "MyText",
        muscle_group: muscle_group
      )
    ])
  end

  it "renders a list of muscles" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Legs".to_s), count: 2
  end
end
