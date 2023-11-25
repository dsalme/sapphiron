require 'rails_helper'

RSpec.describe "protocols/new", type: :view do
  before(:each) do
    assign(:protocol, Protocol.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new protocol form" do
    render

    assert_select "form[action=?][method=?]", protocols_path, "post" do

      assert_select "input[name=?]", "protocol[name]"

      assert_select "textarea[name=?]", "protocol[description]"
    end
  end
end
