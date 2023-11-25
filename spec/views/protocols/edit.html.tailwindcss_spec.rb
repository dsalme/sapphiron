require 'rails_helper'

RSpec.describe "protocols/edit", type: :view do
  let(:protocol) {
    Protocol.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:protocol, protocol)
  end

  it "renders the edit protocol form" do
    render

    assert_select "form[action=?][method=?]", protocol_path(protocol), "post" do

      assert_select "input[name=?]", "protocol[name]"

      assert_select "textarea[name=?]", "protocol[description]"
    end
  end
end
