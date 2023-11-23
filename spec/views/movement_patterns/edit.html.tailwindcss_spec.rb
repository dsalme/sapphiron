require 'rails_helper'

RSpec.describe 'movement_patterns/edit', type: :view do
  let(:movement_pattern) do
    MovementPattern.create!(
      name: 'MyString',
      description: 'MyText'
    )
  end

  before(:each) do
    assign(:movement_pattern, movement_pattern)
  end

  it 'renders the edit movement_pattern form' do
    render

    assert_select 'form[action=?][method=?]', movement_pattern_path(movement_pattern), 'post' do
      assert_select 'input[name=?]', 'movement_pattern[name]'

      assert_select 'textarea[name=?]', 'movement_pattern[description]'
    end
  end
end
