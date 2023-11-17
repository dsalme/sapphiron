require 'rails_helper'

RSpec.describe "muscles/edit", type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: "Legs") }
  let(:muscle) {
    Muscle.create!(
      name: "MyString",
      description: "MyText",
      muscle_group: muscle_group
    )
  }

  before(:each) do
    assign(:muscle, muscle)
    assign(:muscle_groups, [muscle_group])
  end

  it "renders the edit muscle form" do
    render

    assert_select "form[action=?][method=?]", muscle_path(muscle), "post" do

      assert_select "input[name=?]", "muscle[name]"

      assert_select "textarea[name=?]", "muscle[description]"

      assert_select "select[name=?]", "muscle[muscle_group_id]"
    end
  end
end
