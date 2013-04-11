require 'spec_helper'

describe "ItunesPlayers" do
  describe "GET /itunes_players" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get itunes_players_path
      response.status.should be(200)
    end
  end
end
