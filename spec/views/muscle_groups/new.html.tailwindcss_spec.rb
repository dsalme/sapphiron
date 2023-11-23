require 'rails_helper'

RSpec.describe 'muscle_groups/new', type: :view do
  before(:each) do
    assign(:muscle_group, MuscleGroup.new(
                            name: 'MyString',
                            description: 'MyText'
                          ))
  end

  it 'renders new muscle_group form' do
    render

    assert_select 'form[action=?][method=?]', muscle_groups_path, 'post' do
      assert_select 'input[name=?]', 'muscle_group[name]'

      assert_select 'textarea[name=?]', 'muscle_group[description]'
    end
  end
end
