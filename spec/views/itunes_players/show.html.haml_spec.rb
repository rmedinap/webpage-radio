require 'spec_helper'

describe "itunes_players/show" do
  before(:each) do
    @itunes_player = assign(:itunes_player, stub_model(ItunesPlayer,
      :embed => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
