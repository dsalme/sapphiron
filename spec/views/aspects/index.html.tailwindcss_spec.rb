require 'rails_helper'

RSpec.describe "aspects/index", type: :view do
  before(:each) do
    assign(:aspects, [
      Aspect.create!(
        name: "Name",
        description: "MyText"
      ),
      Aspect.create!(
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of aspects" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
