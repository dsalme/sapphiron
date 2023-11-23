require 'rails_helper'

RSpec.describe 'muscle_groups/show', type: :view do
  before(:each) do
    assign(:muscle_group, MuscleGroup.create!(
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
