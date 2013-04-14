require 'spec_helper'

describe "quienes_somos/show" do
  before(:each) do
    @quienes_somos = assign(:quienes_somos, stub_model(QuienesSomos,
      :descripcion => "MyText",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Slug/)
  end
end
