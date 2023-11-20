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

RSpec.describe "/muscle_groups", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # MuscleGroup. As you add validations to MuscleGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      MuscleGroup.create! valid_attributes
      get muscle_groups_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      muscle_group = MuscleGroup.create! valid_attributes
      get muscle_group_url(muscle_group)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_muscle_group_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      muscle_group = MuscleGroup.create! valid_attributes
      get edit_muscle_group_url(muscle_group)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MuscleGroup" do
        expect {
          post muscle_groups_url, params: { muscle_group: valid_attributes }
        }.to change(MuscleGroup, :count).by(1)
      end

      it "redirects to the created muscle_group" do
        post muscle_groups_url, params: { muscle_group: valid_attributes }
        expect(response).to redirect_to(muscle_group_url(MuscleGroup.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MuscleGroup" do
        expect {
          post muscle_groups_url, params: { muscle_group: invalid_attributes }
        }.to change(MuscleGroup, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post muscle_groups_url, params: { muscle_group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested muscle_group" do
        muscle_group = MuscleGroup.create! valid_attributes
        patch muscle_group_url(muscle_group), params: { muscle_group: new_attributes }
        muscle_group.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the muscle_group" do
        muscle_group = MuscleGroup.create! valid_attributes
        patch muscle_group_url(muscle_group), params: { muscle_group: new_attributes }
        muscle_group.reload
        expect(response).to redirect_to(muscle_group_url(muscle_group))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        muscle_group = MuscleGroup.create! valid_attributes
        patch muscle_group_url(muscle_group), params: { muscle_group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested muscle_group" do
      muscle_group = MuscleGroup.create! valid_attributes
      expect {
        delete muscle_group_url(muscle_group)
      }.to change(MuscleGroup, :count).by(-1)
    end

    it "redirects to the muscle_groups list" do
      muscle_group = MuscleGroup.create! valid_attributes
      delete muscle_group_url(muscle_group)
      expect(response).to redirect_to(muscle_groups_url)
    end
  end
end
