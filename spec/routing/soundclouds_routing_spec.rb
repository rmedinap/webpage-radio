require "spec_helper"

describe SoundcloudsController do
  describe "routing" do

    it "routes to #index" do
      get("/soundclouds").should route_to("soundclouds#index")
    end

    it "routes to #new" do
      get("/soundclouds/new").should route_to("soundclouds#new")
    end

    it "routes to #show" do
      get("/soundclouds/1").should route_to("soundclouds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/soundclouds/1/edit").should route_to("soundclouds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/soundclouds").should route_to("soundclouds#create")
    end

    it "routes to #update" do
      put("/soundclouds/1").should route_to("soundclouds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/soundclouds/1").should route_to("soundclouds#destroy", :id => "1")
    end

  end
end
