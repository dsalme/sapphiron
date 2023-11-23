require 'rails_helper'

RSpec.describe 'movement_patterns/show', type: :view do
  before(:each) do
    assign(:movement_pattern, MovementPattern.create!(
                                name: 'Name',
                                description: 'MyText'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
