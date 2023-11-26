require 'rails_helper'

RSpec.describe "blocks/show", type: :view do
  before(:each) do
    assign(:block, Block.create!(
                     name: "Name",
                     description: "MyText",
                     protocol: nil,
                     aspect: nil,
                     series: 2,
                     duration: 3
                   ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
