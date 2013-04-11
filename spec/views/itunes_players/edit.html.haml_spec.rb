require 'spec_helper'

describe "itunes_players/edit" do
  before(:each) do
    @itunes_player = assign(:itunes_player, stub_model(ItunesPlayer,
      :embed => "MyText"
    ))
  end

  it "renders the edit itunes_player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", itunes_player_path(@itunes_player), "post" do
      assert_select "textarea#itunes_player_embed[name=?]", "itunes_player[embed]"
    end
  end
end
