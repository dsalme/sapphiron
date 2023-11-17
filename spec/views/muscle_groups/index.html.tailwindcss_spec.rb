require 'rails_helper'

RSpec.describe "muscle_groups/index", type: :view do
  before(:each) do
    assign(:muscle_groups, [
      MuscleGroup.create!(
        name: "Name",
        description: "MyText"
      ),
      MuscleGroup.create!(
        name: "Name2",
        description: "MyText"
      )
    ])
  end

  it "renders a list of muscle_groups" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
