require 'rails_helper'

RSpec.describe "exercises/show", type: :view do
  let(:account) {Account.create!(email: "user@example.com", password: "secret123", status: "verified")}

  before(:each) do
    Profile.create!(name: "hola", account: account)
    assign(:exercise, Exercise.create!(
      name: "Name",
      account: account
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
