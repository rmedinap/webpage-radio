require "spec_helper"

describe QuienesSomosController do
  describe "routing" do

    it "routes to #index" do
      get("/quienes_somos").should route_to("quienes_somos#index")
    end

    it "routes to #new" do
      get("/quienes_somos/new").should route_to("quienes_somos#new")
    end

    it "routes to #show" do
      get("/quienes_somos/1").should route_to("quienes_somos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/quienes_somos/1/edit").should route_to("quienes_somos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/quienes_somos").should route_to("quienes_somos#create")
    end

    it "routes to #update" do
      put("/quienes_somos/1").should route_to("quienes_somos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/quienes_somos/1").should route_to("quienes_somos#destroy", :id => "1")
    end

  end
end
