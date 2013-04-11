require 'spec_helper'

describe "auspiciadores/index" do
  before(:each) do
    assign(:auspiciadores, [
      stub_model(Auspiciador,
        :link => "Link"
      ),
      stub_model(Auspiciador,
        :link => "Link"
      )
    ])
  end

  it "renders a list of auspiciadores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
