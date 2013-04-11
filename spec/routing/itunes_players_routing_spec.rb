require "spec_helper"

describe ItunesPlayersController do
  describe "routing" do

    it "routes to #index" do
      get("/itunes_players").should route_to("itunes_players#index")
    end

    it "routes to #new" do
      get("/itunes_players/new").should route_to("itunes_players#new")
    end

    it "routes to #show" do
      get("/itunes_players/1").should route_to("itunes_players#show", :id => "1")
    end

    it "routes to #edit" do
      get("/itunes_players/1/edit").should route_to("itunes_players#edit", :id => "1")
    end

    it "routes to #create" do
      post("/itunes_players").should route_to("itunes_players#create")
    end

    it "routes to #update" do
      put("/itunes_players/1").should route_to("itunes_players#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/itunes_players/1").should route_to("itunes_players#destroy", :id => "1")
    end

  end
end
