require 'rails_helper'

RSpec.describe "blocks/edit", type: :view do
  let(:protocol) { Protocol.create!(name: "Protocol") }
  let(:aspect) { Aspect.create!(name: "Aspect") }
  let(:block) {
    Block.create!(
      name: "Block",
      description: "MyText",
      protocol: protocol,
      aspect: aspect,
      series: 1,
      duration: 1,
      user: FactoryBot.create(:user)
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
