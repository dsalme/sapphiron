require 'rails_helper'

RSpec.describe "muscles/index", type: :view do
  before(:each) do
    assign(:muscles, [
      Muscle.create!(
        name: "Name",
        description: "MyText",
        muscle_group: nil
      ),
      Muscle.create!(
        name: "Name",
        description: "MyText",
        muscle_group: nil
      )
    ])
  end

  it "renders a list of muscles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
