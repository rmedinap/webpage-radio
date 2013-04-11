require "spec_helper"

describe AuspiciadoresController do
  describe "routing" do

    it "routes to #index" do
      get("/auspiciadores").should route_to("auspiciadores#index")
    end

    it "routes to #new" do
      get("/auspiciadores/new").should route_to("auspiciadores#new")
    end

    it "routes to #show" do
      get("/auspiciadores/1").should route_to("auspiciadores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/auspiciadores/1/edit").should route_to("auspiciadores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/auspiciadores").should route_to("auspiciadores#create")
    end

    it "routes to #update" do
      put("/auspiciadores/1").should route_to("auspiciadores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/auspiciadores/1").should route_to("auspiciadores#destroy", :id => "1")
    end

  end
end
