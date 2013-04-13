require "spec_helper"

describe DiapositivasController do
  describe "routing" do

    it "routes to #index" do
      get("/diapositivas").should route_to("diapositivas#index")
    end

    it "routes to #new" do
      get("/diapositivas/new").should route_to("diapositivas#new")
    end

    it "routes to #show" do
      get("/diapositivas/1").should route_to("diapositivas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/diapositivas/1/edit").should route_to("diapositivas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/diapositivas").should route_to("diapositivas#create")
    end

    it "routes to #update" do
      put("/diapositivas/1").should route_to("diapositivas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/diapositivas/1").should route_to("diapositivas#destroy", :id => "1")
    end

  end
end
