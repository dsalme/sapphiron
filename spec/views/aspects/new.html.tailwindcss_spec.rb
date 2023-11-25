require 'rails_helper'

RSpec.describe "aspects/new", type: :view do
  before(:each) do
    assign(:aspect, Aspect.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new aspect form" do
    render

    assert_select "form[action=?][method=?]", aspects_path, "post" do

      assert_select "input[name=?]", "aspect[name]"

      assert_select "textarea[name=?]", "aspect[description]"
    end
  end
end
