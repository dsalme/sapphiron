require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/movement_patterns", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # MovementPattern. As you add validations to MovementPattern, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  def login(email, password)
    post "/login", params: { email: email, password: password }
    assert_redirected_to "/"
  end

  def logout
    post "/logout"
    assert_redirected_to "/login"
  end

  describe "GET /index" do
    it "renders a successful response" do
      MovementPattern.create! valid_attributes
      get movement_patterns_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      movement_pattern = MovementPattern.create! valid_attributes
      get movement_pattern_url(movement_pattern)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    before do
      account = Account.create!(email: "user@example.com", password: "secret123", status: "verified")
      Profile.create!(name: "hola", account: account)
      login(account.email, "secret123")
    end
    it "renders a successful response" do
      get new_movement_pattern_url
      expect(response).to be_successful
    end
    after do
      logout
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      movement_pattern = MovementPattern.create! valid_attributes
      get edit_movement_pattern_url(movement_pattern)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MovementPattern" do
        expect {
          post movement_patterns_url, params: { movement_pattern: valid_attributes }
        }.to change(MovementPattern, :count).by(1)
      end

      it "redirects to the created movement_pattern" do
        post movement_patterns_url, params: { movement_pattern: valid_attributes }
        expect(response).to redirect_to(movement_pattern_url(MovementPattern.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MovementPattern" do
        expect {
          post movement_patterns_url, params: { movement_pattern: invalid_attributes }
        }.to change(MovementPattern, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post movement_patterns_url, params: { movement_pattern: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested movement_pattern" do
        movement_pattern = MovementPattern.create! valid_attributes
        patch movement_pattern_url(movement_pattern), params: { movement_pattern: new_attributes }
        movement_pattern.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the movement_pattern" do
        movement_pattern = MovementPattern.create! valid_attributes
        patch movement_pattern_url(movement_pattern), params: { movement_pattern: new_attributes }
        movement_pattern.reload
        expect(response).to redirect_to(movement_pattern_url(movement_pattern))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        movement_pattern = MovementPattern.create! valid_attributes
        patch movement_pattern_url(movement_pattern), params: { movement_pattern: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested movement_pattern" do
      movement_pattern = MovementPattern.create! valid_attributes
      expect {
        delete movement_pattern_url(movement_pattern)
      }.to change(MovementPattern, :count).by(-1)
    end

    it "redirects to the movement_patterns list" do
      movement_pattern = MovementPattern.create! valid_attributes
      delete movement_pattern_url(movement_pattern)
      expect(response).to redirect_to(movement_patterns_url)
    end
  end
end
