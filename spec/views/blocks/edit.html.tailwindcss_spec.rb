require 'rails_helper'

RSpec.describe "blocks/edit", type: :view do
  let(:block) {
    Block.create!(
      name: "MyString",
      description: "MyText",
      protocol: nil,
      aspect: nil,
      series: 1,
      duration: 1
    )
  }

  before(:each) do
    assign(:block, block)
  end

  it "renders the edit block form" do
    render

    assert_select "form[action=?][method=?]", block_path(block), "post" do

      assert_select "input[name=?]", "block[name]"

      assert_select "textarea[name=?]", "block[description]"

      assert_select "input[name=?]", "block[protocol_id]"

      assert_select "input[name=?]", "block[aspect_id]"

      assert_select "input[name=?]", "block[series]"

      assert_select "input[name=?]", "block[duration]"
    end
  end
end
