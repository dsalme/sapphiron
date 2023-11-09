require 'rails_helper'

RSpec.describe "tools/new", type: :view do
  before(:each) do
    assign(:tool, Tool.new(
      name: "MyString",
      description: "MyText",
      thumbnail_url: "MyString"
    ))
  end

  it "renders new tool form" do
    render

    assert_select "form[action=?][method=?]", tools_path, "post" do

      assert_select "input[name=?]", "tool[name]"

      assert_select "textarea[name=?]", "tool[description]"

      assert_select "input[name=?]", "tool[thumbnail_url]"
    end
  end
end
