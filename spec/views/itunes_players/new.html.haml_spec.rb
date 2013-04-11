require 'spec_helper'

describe "itunes_players/new" do
  before(:each) do
    assign(:itunes_player, stub_model(ItunesPlayer,
      :embed => "MyText"
    ).as_new_record)
  end

  it "renders new itunes_player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", itunes_players_path, "post" do
      assert_select "textarea#itunes_player_embed[name=?]", "itunes_player[embed]"
    end
  end
end
