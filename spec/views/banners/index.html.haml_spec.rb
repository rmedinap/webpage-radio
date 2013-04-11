require 'spec_helper'

describe "banners/index" do
  before(:each) do
    assign(:banners, [
      stub_model(Banner,
        :pie_de_foto => "Pie De Foto"
      ),
      stub_model(Banner,
        :pie_de_foto => "Pie De Foto"
      )
    ])
  end

  it "renders a list of banners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pie De Foto".to_s, :count => 2
  end
end
