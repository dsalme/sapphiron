require "rails_helper"

RSpec.describe MusclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/muscles").to route_to("muscles#index")
    end

    it "routes to #new" do
      expect(get: "/muscles/new").to route_to("muscles#new")
    end

    it "routes to #show" do
      expect(get: "/muscles/1").to route_to("muscles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/muscles/1/edit").to route_to("muscles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/muscles").to route_to("muscles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/muscles/1").to route_to("muscles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/muscles/1").to route_to("muscles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/muscles/1").to route_to("muscles#destroy", id: "1")
    end
  end
end
