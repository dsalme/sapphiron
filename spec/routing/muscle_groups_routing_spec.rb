require "rails_helper"

RSpec.describe MuscleGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/muscle_groups").to route_to("muscle_groups#index")
    end

    it "routes to #new" do
      expect(get: "/muscle_groups/new").to route_to("muscle_groups#new")
    end

    it "routes to #show" do
      expect(get: "/muscle_groups/1").to route_to("muscle_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/muscle_groups/1/edit").to route_to("muscle_groups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/muscle_groups").to route_to("muscle_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/muscle_groups/1").to route_to("muscle_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/muscle_groups/1").to route_to("muscle_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/muscle_groups/1").to route_to("muscle_groups#destroy", id: "1")
    end
  end
end
