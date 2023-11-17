require 'rails_helper'

RSpec.describe "muscles/new", type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: "Legs") }
  before(:each) do
    assign(:muscle, Muscle.new(
      name: "MyString",
      description: "MyText",
      muscle_group: muscle_group
    ))
    assign(:muscle_groups, [muscle_group])
  end

  it "renders new muscle form" do
    render

    assert_select "form[action=?][method=?]", muscles_path, "post" do

      assert_select "input[name=?]", "muscle[name]"

      assert_select "textarea[name=?]", "muscle[description]"

      assert_select "select[name=?]", "muscle[muscle_group_id]"
    end
  end
end
