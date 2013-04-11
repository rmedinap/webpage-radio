require 'spec_helper'

describe "categoria/index" do
  before(:each) do
    assign(:categoria, [
      stub_model(Categorium,
        :nombre => "Nombre"
      ),
      stub_model(Categorium,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of categoria" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
