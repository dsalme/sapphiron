require 'rails_helper'

RSpec.describe "tools/show", type: :view do
  before(:each) do
    assign(:tool, Tool.create!(
      name: "Name",
      description: "MyText",
      thumbnail_url: "Thumbnail Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Thumbnail Url/)
  end
end
