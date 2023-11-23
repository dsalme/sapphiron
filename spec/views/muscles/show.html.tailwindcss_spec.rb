require 'rails_helper'

RSpec.describe 'muscles/show', type: :view do
  let(:muscle_group) { MuscleGroup.create!(name: 'Legs') }
  before(:each) do
    assign(:muscle, Muscle.create!(
                      name: 'Name',
                      description: 'MyText',
                      muscle_group:
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Legs/)
  end
end
