require 'rails_helper'

RSpec.describe "tools/index", type: :view do
  before(:each) do
    assign(:tools, [
      Tool.create!(
        name: "Name",
        description: "MyText",
        thumbnail_url: "Thumbnail Url"
      ),
      Tool.create!(
        name: "Name",
        description: "MyText",
        thumbnail_url: "Thumbnail Url"
      )
    ])
  end

  it "renders a list of tools" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Thumbnail Url".to_s), count: 2
  end
end
