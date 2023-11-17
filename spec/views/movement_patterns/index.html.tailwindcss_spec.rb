require 'rails_helper'

RSpec.describe "movement_patterns/index", type: :view do
  before(:each) do
    assign(:movement_patterns, [
      MovementPattern.create!(
        name: "Name",
        description: "MyText"
      ),
      MovementPattern.create!(
        name: "Name2",
        description: "MyText"
      )
    ])
  end

  it "renders a list of movement_patterns" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
