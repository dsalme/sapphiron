require 'rails_helper'

RSpec.describe "blocks/index", type: :view do
  before(:each) do
    assign(:blocks, [
             Block.create!(
               name: "Name",
               description: "MyText",
               protocol: nil,
               aspect: nil,
               series: 2,
               duration: 3
             ),
             Block.create!(
               name: "Name",
               description: "MyText",
               protocol: nil,
               aspect: nil,
               series: 2,
               duration: 3
             )
           ])
  end

  it "renders a list of blocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
