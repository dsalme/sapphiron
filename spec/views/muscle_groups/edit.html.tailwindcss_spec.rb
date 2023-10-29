require 'rails_helper'

RSpec.describe "muscle_groups/edit", type: :view do
  let(:muscle_group) {
    MuscleGroup.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:muscle_group, muscle_group)
  end

  it "renders the edit muscle_group form" do
    render

    assert_select "form[action=?][method=?]", muscle_group_path(muscle_group), "post" do

      assert_select "input[name=?]", "muscle_group[name]"

      assert_select "textarea[name=?]", "muscle_group[description]"
    end
  end
end
