require 'rails_helper'

RSpec.describe "blocks/new", type: :view do
  before(:each) do
    assign(:block, Block.new(
                     name: "MyString",
                     description: "MyText",
                     protocol: nil,
                     aspect: nil,
                     series: 1,
                     duration: 1
                   ))
  end

  it "renders new block form" do
    render

    assert_select "form[action=?][method=?]", blocks_path, "post" do
      assert_select "input[name=?]", "block[name]"

      assert_select "textarea[name=?]", "block[description]"

      assert_select "input[name=?]", "block[protocol_id]"

      assert_select "input[name=?]", "block[aspect_id]"

      assert_select "input[name=?]", "block[series]"

      assert_select "input[name=?]", "block[duration]"
    end
  end
end
