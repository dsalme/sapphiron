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

RSpec.describe "/routines", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Routine. As you add validations to Routine, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Routine.create! valid_attributes
      get routines_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      routine = Routine.create! valid_attributes
      get routine_url(routine)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    before do
      sign_in FactoryBot.create(:user)
    end
    it "renders a successful response" do
      get new_routine_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      routine = Routine.create! valid_attributes
      get edit_routine_url(routine)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Routine" do
        expect {
          post routines_url, params: { routine: valid_attributes }
        }.to change(Routine, :count).by(1)
      end

      it "redirects to the created routine" do
        post routines_url, params: { routine: valid_attributes }
        expect(response).to redirect_to(routine_url(Routine.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Routine" do
        expect {
          post routines_url, params: { routine: invalid_attributes }
        }.to change(Routine, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post routines_url, params: { routine: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested routine" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: new_attributes }
        routine.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the routine" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: new_attributes }
        routine.reload
        expect(response).to redirect_to(routine_url(routine))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        routine = Routine.create! valid_attributes
        patch routine_url(routine), params: { routine: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested routine" do
      routine = Routine.create! valid_attributes
      expect {
        delete routine_url(routine)
      }.to change(Routine, :count).by(-1)
    end

    it "redirects to the routines list" do
      routine = Routine.create! valid_attributes
      delete routine_url(routine)
      expect(response).to redirect_to(routines_url)
    end
  end
end
