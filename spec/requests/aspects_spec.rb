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

RSpec.describe "/aspects", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Aspect. As you add validations to Aspect, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Aspect.create! valid_attributes
      get aspects_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      aspect = Aspect.create! valid_attributes
      get aspect_url(aspect)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    before do
      sign_in FactoryBot.create(:user)
    end
    it "renders a successful response" do
      get new_aspect_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      aspect = Aspect.create! valid_attributes
      get edit_aspect_url(aspect)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Aspect" do
        expect {
          post aspects_url, params: { aspect: valid_attributes }
        }.to change(Aspect, :count).by(1)
      end

      it "redirects to the created aspect" do
        post aspects_url, params: { aspect: valid_attributes }
        expect(response).to redirect_to(aspect_url(Aspect.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Aspect" do
        expect {
          post aspects_url, params: { aspect: invalid_attributes }
        }.to change(Aspect, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post aspects_url, params: { aspect: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested aspect" do
        aspect = Aspect.create! valid_attributes
        patch aspect_url(aspect), params: { aspect: new_attributes }
        aspect.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the aspect" do
        aspect = Aspect.create! valid_attributes
        patch aspect_url(aspect), params: { aspect: new_attributes }
        aspect.reload
        expect(response).to redirect_to(aspect_url(aspect))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        aspect = Aspect.create! valid_attributes
        patch aspect_url(aspect), params: { aspect: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested aspect" do
      aspect = Aspect.create! valid_attributes
      expect {
        delete aspect_url(aspect)
      }.to change(Aspect, :count).by(-1)
    end

    it "redirects to the aspects list" do
      aspect = Aspect.create! valid_attributes
      delete aspect_url(aspect)
      expect(response).to redirect_to(aspects_url)
    end
  end
end
