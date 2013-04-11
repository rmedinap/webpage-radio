require 'spec_helper'

describe "itunes_players/index" do
  before(:each) do
    assign(:itunes_players, [
      stub_model(ItunesPlayer,
        :embed => "MyText"
      ),
      stub_model(ItunesPlayer,
        :embed => "MyText"
      )
    ])
  end

  it "renders a list of itunes_players" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
