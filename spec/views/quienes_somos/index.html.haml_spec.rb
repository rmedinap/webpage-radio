require 'spec_helper'

describe "quienes_somos/index" do
  before(:each) do
    assign(:quienes_somos, [
      stub_model(QuienesSomos,
        :descripcion => "MyText",
        :slug => "Slug"
      ),
      stub_model(QuienesSomos,
        :descripcion => "MyText",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of quienes_somos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
