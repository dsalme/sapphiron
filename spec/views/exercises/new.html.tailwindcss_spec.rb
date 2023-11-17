require 'rails_helper'

RSpec.describe "exercises/new", type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: "Legs") }
  let(:muscle) { Muscle.create!(name: "Quadriceps", muscle_group: muscle_group) }
  before(:each) do
    assign(:exercise, Exercise.new(
      name: "MyString",
      description: "MyText"
    ))
    assign(:muscle_groups, [muscle_group])
    assign(:muscles, [muscle])
    assign(:tools, [])
    assign(:movement_patterns, [])
  end

  it "renders new exercise form" do
    render

    assert_select "form[action=?][method=?]", exercises_path, "post" do

      assert_select "input[name=?]", "exercise[name]"

      assert_select "textarea[name=?]", "exercise[description]"
    end
  end
end
