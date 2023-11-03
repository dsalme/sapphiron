require 'rails_helper'

RSpec.describe "movement_patterns/new", type: :view do
  before(:each) do
    assign(:movement_pattern, MovementPattern.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new movement_pattern form" do
    render

    assert_select "form[action=?][method=?]", movement_patterns_path, "post" do

      assert_select "input[name=?]", "movement_pattern[name]"

      assert_select "textarea[name=?]", "movement_pattern[description]"
    end
  end
end
