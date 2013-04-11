require 'spec_helper'

describe "djs/index" do
  before(:each) do
    assign(:djs, [
      stub_model(Dj,
        :nombre => "Nombre"
      ),
      stub_model(Dj,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of djs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
