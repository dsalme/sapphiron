require 'rails_helper'

RSpec.describe "blocks/index", type: :view do
  let(:protocol) { Protocol.create!(name: "Protocol") }
  let(:aspect) { Aspect.create!(name: "Aspect") }
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    assign(:blocks, [
             Block.create!(
               name: "Name",
               description: "MyText",
               protocol: protocol,
               aspect: aspect,
               series: 2,
               duration: 3,
               user: user
             ),
             Block.create!(
               name: "Name1",
               description: "MyText",
               protocol: protocol,
               aspect: aspect,
               series: 2,
               duration: 3,
               user: user
             )
           ])
  end

  it "renders a list of blocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
