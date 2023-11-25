require "rails_helper"

RSpec.describe AspectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/aspects").to route_to("aspects#index")
    end

    it "routes to #new" do
      expect(get: "/aspects/new").to route_to("aspects#new")
    end

    it "routes to #show" do
      expect(get: "/aspects/1").to route_to("aspects#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/aspects/1/edit").to route_to("aspects#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/aspects").to route_to("aspects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/aspects/1").to route_to("aspects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/aspects/1").to route_to("aspects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/aspects/1").to route_to("aspects#destroy", id: "1")
    end
  end
end
