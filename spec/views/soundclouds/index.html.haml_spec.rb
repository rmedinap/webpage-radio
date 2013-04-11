require 'spec_helper'

describe "soundclouds/index" do
  before(:each) do
    assign(:soundclouds, [
      stub_model(Soundcloud,
        :link => "Link"
      ),
      stub_model(Soundcloud,
        :link => "Link"
      )
    ])
  end

  it "renders a list of soundclouds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
