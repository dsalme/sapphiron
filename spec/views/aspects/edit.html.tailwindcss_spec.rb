require 'rails_helper'

RSpec.describe "aspects/edit", type: :view do
  let(:aspect) {
    Aspect.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:aspect, aspect)
  end

  it "renders the edit aspect form" do
    render

    assert_select "form[action=?][method=?]", aspect_path(aspect), "post" do

      assert_select "input[name=?]", "aspect[name]"

      assert_select "textarea[name=?]", "aspect[description]"
    end
  end
end
