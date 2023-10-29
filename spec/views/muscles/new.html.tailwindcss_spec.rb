require 'rails_helper'

RSpec.describe "muscles/new", type: :view do
  before(:each) do
    assign(:muscle, Muscle.new(
      name: "MyString",
      description: "MyText",
      muscle_group: nil
    ))
  end

  it "renders new muscle form" do
    render

    assert_select "form[action=?][method=?]", muscles_path, "post" do

      assert_select "input[name=?]", "muscle[name]"

      assert_select "textarea[name=?]", "muscle[description]"

      assert_select "input[name=?]", "muscle[muscle_group_id]"
    end
  end
end
