require 'rails_helper'

RSpec.describe "muscles/edit", type: :view do
  let(:muscle) {
    Muscle.create!(
      name: "MyString",
      description: "MyText",
      muscle_group: nil
    )
  }

  before(:each) do
    assign(:muscle, muscle)
  end

  it "renders the edit muscle form" do
    render

    assert_select "form[action=?][method=?]", muscle_path(muscle), "post" do

      assert_select "input[name=?]", "muscle[name]"

      assert_select "textarea[name=?]", "muscle[description]"

      assert_select "input[name=?]", "muscle[muscle_group_id]"
    end
  end
end
