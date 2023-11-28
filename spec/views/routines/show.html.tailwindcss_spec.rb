require 'rails_helper'

RSpec.describe "routines/show", type: :view do
  before(:each) do
    assign(:routine, Routine.create!(
                       name: "Name",
                       description: "MyText",
                       user: nil
                     ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
